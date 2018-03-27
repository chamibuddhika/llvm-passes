/**
 * Obfuscation through duplication of Basic blocks guarded
 *
 * This clones some basic blocks, guarded by a condition that depends on the
 * context. Each branch should then be obfuscated in different ways.
 *
 * This showcases the development of a Function pass that relies on a
 * home-grown analysis.
 */

/* for debug support */
#define DEBUG_TYPE "duplicate-bb"
#include "llvm/Support/Debug.h"

/* for stat support */
#include "llvm/ADT/Statistic.h"
STATISTIC(DuplicateBBCount, "The # of duplicated blocks");

#include "llvm/Pass.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/RandomNumberGenerator.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include "ReachableIntegerValues.h"
#include "Utils.h"

// Similar to MBA's
static llvm::cl::opt<Ratio> DuplicateBBRatio{
    "duplicate-bb-ratio",
    llvm::cl::desc("Only apply the duplicate basic block "
                   "pass on <ratio> of the basic blocks"),
    llvm::cl::value_desc("ratio"),
    llvm::cl::init(1.),
    llvm::cl::Optional
};

using namespace llvm;

namespace {

class DuplicateBB : public llvm::FunctionPass {

public:
  static char ID;
  compat::RandomNumberGenerator RNG;

  DuplicateBB() : llvm::FunctionPass(ID), RNG(nullptr) {}

  bool doInitialization(Module &M) override {
    RNG = M.createRNG(this).get();
    return false;
  }

  // Declare the analysis dependency
  void getAnalysisUsage(AnalysisUsage &Info) const override {
    Info.addRequired<ReachableIntegerValuesPass>();
  }

  bool runOnFunction(Function &F) override {

    double const Ratio = DuplicateBBRatio.getValue().getRatio();

    std::uniform_real_distribution<double> Dist(0., 1.);

    // We're going to modify the CFG, so work on a copy
    std::vector<std::tuple<BasicBlock *, Value *>> Targets;

    // Get the result of the analysis
    auto const &RIV = getAnalysis<ReachableIntegerValuesPass>()
                          .getReachableIntegerValuesMap();

    for (BasicBlock &BB : F) {
      // do not handle exception stuff
      if (BB.isLandingPad())
        continue;

      if (Dist(RNG) <= Ratio) {
        // Do we have any integer value reachable from this BB?
        auto const &ReachableValues = RIV.lookup(&BB);
        size_t ReachableValuesCount = ReachableValues.size();
        if (ReachableValuesCount) {
          // Yes! pick a random one
          std::uniform_int_distribution<size_t> Dist(0, ReachableValuesCount-1);
          auto Iter = ReachableValues.begin();
          std::advance(Iter, Dist(RNG));
          DEBUG(errs() << "picking: " << **Iter
                       << " as random context value\n");
          // Store the binding and a BB to duplicate and the context variable
          // used to hide it
          Targets.emplace_back(&BB, *Iter);

          ++DuplicateBBCount;
        } else {
          DEBUG(errs() << "no context value found\n");
        }
      }
    }

    // Run the actual duplication

    // Because we will modify values, we need to
    // keep track of the new bindings, otherwise, the information from the
    // ReachableIntegerValuesPass will be obsolete

    std::map<Value *, Value *> ReMapper;
    for (auto &BB_Ctx : Targets) {
      duplicate(*std::get<0>(BB_Ctx), std::get<1>(BB_Ctx), ReMapper);
    }

    return not Targets.empty();
  }

private:
  void duplicate(BasicBlock &BB, Value *ContextValue,
                 std::map<Value *, Value *> &ReMapper) {
    // do not duplicate phi nodes and the likes, so start right after them
    Instruction *BBHead = BB.getFirstNonPHI();

    IRBuilder<> Builder(BBHead);

    Value *Cond = Builder.CreateIsNull(
        ReMapper.count(ContextValue) ?
        ReMapper[ContextValue] :
        ContextValue);

    // the goals is to get from
    // BB --> TERM
    // to
    //        BB Clone
    // COND <          > TAIL --> TERM
    //        BB Clone
    //
    // where TAIL contains PHI nodes that merges the two branches

    TerminatorInst *ThenTerm = nullptr, *ElseTerm = nullptr;
    // useful function from /BasicBlockUtils.h to create the new CFG
    SplitBlockAndInsertIfThenElse(Cond, &*BBHead, &ThenTerm, &ElseTerm);

    BasicBlock *Tail = ThenTerm->getSuccessor(0);

    // This does more than a simple Value to Value map!
    ValueToValueMapTy TailVMap;
    ValueToValueMapTy ThenVMap;
    ValueToValueMapTy ElseVMap;

    // It's always hazardous to remove instruction on the fly, so store them here and purge later
    SmallVector<Instruction*, 8> ToRemove;

    // iterate through the original basic block, clone every instruction to
    // add them to the true/false branch
    // and update their use on the fly, through values stored in then_mapping
    // and else_mapping
    for (auto IIT = Tail->begin(), IE = Tail->end();
         IIT != IE; ++IIT)
    {
      Instruction &Instr = *IIT;
      assert(not isa<PHINode>(&Instr) and
             "phi nodes have already been filtered out");

      // We have a different processing of the last instruction
      if (not isa<TerminatorInst>(&Instr)) {
        // once the instruction is cloned, its operand still hold reference to
        // the original basic block
        // we want them to refer to the cloned one! The mappings are used for
        // this
        Instruction *ThenClone = Instr.clone(),
                    *ElseClone = Instr.clone();

        RemapInstruction(ThenClone, ThenVMap, RF_IgnoreMissingLocals);
        ThenClone->insertBefore(ThenTerm);
        ThenVMap[&Instr] = ThenClone;

        RemapInstruction(ElseClone, ElseVMap, RF_IgnoreMissingLocals);
        ElseClone->insertBefore(ElseTerm);
        ElseVMap[&Instr] = ElseClone;

        // instructions that don't produce a value don't need to be in the Tail
        if(ThenClone->getType()->isVoidTy()) {
          ToRemove.push_back(&Instr);
        }
        else {
        // instruction that produce a value should not require a slot in the
        // TAIL *but* they can be used from the context, so just always
        // generate a PHI, and let further optimization do the cleaning
          PHINode *Phi = PHINode::Create(ThenClone->getType(), 3);
          Phi->addIncoming(ThenClone, ThenTerm->getParent());
          Phi->addIncoming(ElseClone, ElseTerm->getParent());
          TailVMap[&Instr] = Phi;

          ReMapper[&Instr] = Phi;

          // As we modify the instructions as we go,
          // use the iterator version of ReplaceInstWithInst
          ReplaceInstWithInst(Tail->getInstList(),
                              IIT, Phi);
        }
      } else {
        RemapInstruction(&Instr, TailVMap, RF_IgnoreMissingLocals);
      }
    }

    // purging the instructions that don't produce a value from the Tail
    for(auto* I : ToRemove)
      I->eraseFromParent();
  }
};
}

/* for opt pass registration
 */
char DuplicateBB::ID = 0;
static RegisterPass<DuplicateBB> X("duplicate-bb",
                                   "Duplicate Basic Blocks Pass",
                                   false, // modifies the CFG!
                                   false);

/* for clang pass registration
 */
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

static void registerClangPass(const PassManagerBuilder &,
                              legacy::PassManagerBase &PM) {
  PM.add(new DuplicateBB());
}
static RegisterStandardPasses
    RegisterClangPass(PassManagerBuilder::EP_EarlyAsPossible,
                      registerClangPass);
