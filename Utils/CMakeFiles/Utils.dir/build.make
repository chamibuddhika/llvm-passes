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
include Utils/CMakeFiles/Utils.dir/depend.make

# Include the progress variables for this target.
include Utils/CMakeFiles/Utils.dir/progress.make

# Include the compile flags for this target's objects.
include Utils/CMakeFiles/Utils.dir/flags.make

Utils/CMakeFiles/Utils.dir/Utils.cpp.o: Utils/CMakeFiles/Utils.dir/flags.make
Utils/CMakeFiles/Utils.dir/Utils.cpp.o: Utils/Utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chamibuddhika/Builds/llvm-passes/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Utils/CMakeFiles/Utils.dir/Utils.cpp.o"
	cd /Users/chamibuddhika/Builds/llvm-passes/Utils && /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Utils.dir/Utils.cpp.o -c /Users/chamibuddhika/Builds/llvm-passes/Utils/Utils.cpp

Utils/CMakeFiles/Utils.dir/Utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Utils.dir/Utils.cpp.i"
	cd /Users/chamibuddhika/Builds/llvm-passes/Utils && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/chamibuddhika/Builds/llvm-passes/Utils/Utils.cpp > CMakeFiles/Utils.dir/Utils.cpp.i

Utils/CMakeFiles/Utils.dir/Utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Utils.dir/Utils.cpp.s"
	cd /Users/chamibuddhika/Builds/llvm-passes/Utils && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/chamibuddhika/Builds/llvm-passes/Utils/Utils.cpp -o CMakeFiles/Utils.dir/Utils.cpp.s

Utils/CMakeFiles/Utils.dir/Utils.cpp.o.requires:

.PHONY : Utils/CMakeFiles/Utils.dir/Utils.cpp.o.requires

Utils/CMakeFiles/Utils.dir/Utils.cpp.o.provides: Utils/CMakeFiles/Utils.dir/Utils.cpp.o.requires
	$(MAKE) -f Utils/CMakeFiles/Utils.dir/build.make Utils/CMakeFiles/Utils.dir/Utils.cpp.o.provides.build
.PHONY : Utils/CMakeFiles/Utils.dir/Utils.cpp.o.provides

Utils/CMakeFiles/Utils.dir/Utils.cpp.o.provides.build: Utils/CMakeFiles/Utils.dir/Utils.cpp.o


# Object files for target Utils
Utils_OBJECTS = \
"CMakeFiles/Utils.dir/Utils.cpp.o"

# External object files for target Utils
Utils_EXTERNAL_OBJECTS =

Utils/libUtils.a: Utils/CMakeFiles/Utils.dir/Utils.cpp.o
Utils/libUtils.a: Utils/CMakeFiles/Utils.dir/build.make
Utils/libUtils.a: Utils/CMakeFiles/Utils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/chamibuddhika/Builds/llvm-passes/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libUtils.a"
	cd /Users/chamibuddhika/Builds/llvm-passes/Utils && $(CMAKE_COMMAND) -P CMakeFiles/Utils.dir/cmake_clean_target.cmake
	cd /Users/chamibuddhika/Builds/llvm-passes/Utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Utils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Utils/CMakeFiles/Utils.dir/build: Utils/libUtils.a

.PHONY : Utils/CMakeFiles/Utils.dir/build

Utils/CMakeFiles/Utils.dir/requires: Utils/CMakeFiles/Utils.dir/Utils.cpp.o.requires

.PHONY : Utils/CMakeFiles/Utils.dir/requires

Utils/CMakeFiles/Utils.dir/clean:
	cd /Users/chamibuddhika/Builds/llvm-passes/Utils && $(CMAKE_COMMAND) -P CMakeFiles/Utils.dir/cmake_clean.cmake
.PHONY : Utils/CMakeFiles/Utils.dir/clean

Utils/CMakeFiles/Utils.dir/depend:
	cd /Users/chamibuddhika/Builds/llvm-passes && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/chamibuddhika/Builds/llvm-passes /Users/chamibuddhika/Builds/llvm-passes/Utils /Users/chamibuddhika/Builds/llvm-passes /Users/chamibuddhika/Builds/llvm-passes/Utils /Users/chamibuddhika/Builds/llvm-passes/Utils/CMakeFiles/Utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Utils/CMakeFiles/Utils.dir/depend
