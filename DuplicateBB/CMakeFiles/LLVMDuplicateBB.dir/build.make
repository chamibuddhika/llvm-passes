# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.10.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.10.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/chamibuddhika/Builds/llvm-passes

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/chamibuddhika/Builds/llvm-passes

# Include any dependencies generated for this target.
include DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/depend.make

# Include the progress variables for this target.
include DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/progress.make

# Include the compile flags for this target's objects.
include DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/flags.make

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o: DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/flags.make
DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o: DuplicateBB/DuplicateBB.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chamibuddhika/Builds/llvm-passes/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o"
	cd /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB && /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o -c /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB/DuplicateBB.cpp

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.i"
	cd /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB/DuplicateBB.cpp > CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.i

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.s"
	cd /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB/DuplicateBB.cpp -o CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.s

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.requires:

.PHONY : DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.requires

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.provides: DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.requires
	$(MAKE) -f DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/build.make DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.provides.build
.PHONY : DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.provides

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.provides.build: DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o


# Object files for target LLVMDuplicateBB
LLVMDuplicateBB_OBJECTS = \
"CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o"

# External object files for target LLVMDuplicateBB
LLVMDuplicateBB_EXTERNAL_OBJECTS =

DuplicateBB/LLVMDuplicateBB.dylib: DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o
DuplicateBB/LLVMDuplicateBB.dylib: DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/build.make
DuplicateBB/LLVMDuplicateBB.dylib: Utils/libUtils.a
DuplicateBB/LLVMDuplicateBB.dylib: DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/chamibuddhika/Builds/llvm-passes/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module LLVMDuplicateBB.dylib"
	cd /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LLVMDuplicateBB.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/build: DuplicateBB/LLVMDuplicateBB.dylib

.PHONY : DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/build

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/requires: DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DuplicateBB.cpp.o.requires

.PHONY : DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/requires

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/clean:
	cd /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB && $(CMAKE_COMMAND) -P CMakeFiles/LLVMDuplicateBB.dir/cmake_clean.cmake
.PHONY : DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/clean

DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/depend:
	cd /Users/chamibuddhika/Builds/llvm-passes && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/chamibuddhika/Builds/llvm-passes /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB /Users/chamibuddhika/Builds/llvm-passes /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB /Users/chamibuddhika/Builds/llvm-passes/DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : DuplicateBB/CMakeFiles/LLVMDuplicateBB.dir/depend
