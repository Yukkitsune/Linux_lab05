# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kitsune/Yukkitsune/workspace/tasks/lab03

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build

# Include any dependencies generated for this target.
include solver_lib/CMakeFiles/solver.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include solver_lib/CMakeFiles/solver.dir/compiler_depend.make

# Include the progress variables for this target.
include solver_lib/CMakeFiles/solver.dir/progress.make

# Include the compile flags for this target's objects.
include solver_lib/CMakeFiles/solver.dir/flags.make

solver_lib/CMakeFiles/solver.dir/solver.cpp.o: solver_lib/CMakeFiles/solver.dir/flags.make
solver_lib/CMakeFiles/solver.dir/solver.cpp.o: /home/kitsune/Yukkitsune/workspace/tasks/lab03/solver_lib/solver.cpp
solver_lib/CMakeFiles/solver.dir/solver.cpp.o: solver_lib/CMakeFiles/solver.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object solver_lib/CMakeFiles/solver.dir/solver.cpp.o"
	cd /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT solver_lib/CMakeFiles/solver.dir/solver.cpp.o -MF CMakeFiles/solver.dir/solver.cpp.o.d -o CMakeFiles/solver.dir/solver.cpp.o -c /home/kitsune/Yukkitsune/workspace/tasks/lab03/solver_lib/solver.cpp

solver_lib/CMakeFiles/solver.dir/solver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/solver.dir/solver.cpp.i"
	cd /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kitsune/Yukkitsune/workspace/tasks/lab03/solver_lib/solver.cpp > CMakeFiles/solver.dir/solver.cpp.i

solver_lib/CMakeFiles/solver.dir/solver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/solver.dir/solver.cpp.s"
	cd /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kitsune/Yukkitsune/workspace/tasks/lab03/solver_lib/solver.cpp -o CMakeFiles/solver.dir/solver.cpp.s

# Object files for target solver
solver_OBJECTS = \
"CMakeFiles/solver.dir/solver.cpp.o"

# External object files for target solver
solver_EXTERNAL_OBJECTS =

solver_lib/libsolver.a: solver_lib/CMakeFiles/solver.dir/solver.cpp.o
solver_lib/libsolver.a: solver_lib/CMakeFiles/solver.dir/build.make
solver_lib/libsolver.a: solver_lib/CMakeFiles/solver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libsolver.a"
	cd /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib && $(CMAKE_COMMAND) -P CMakeFiles/solver.dir/cmake_clean_target.cmake
	cd /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/solver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
solver_lib/CMakeFiles/solver.dir/build: solver_lib/libsolver.a
.PHONY : solver_lib/CMakeFiles/solver.dir/build

solver_lib/CMakeFiles/solver.dir/clean:
	cd /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib && $(CMAKE_COMMAND) -P CMakeFiles/solver.dir/cmake_clean.cmake
.PHONY : solver_lib/CMakeFiles/solver.dir/clean

solver_lib/CMakeFiles/solver.dir/depend:
	cd /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kitsune/Yukkitsune/workspace/tasks/lab03 /home/kitsune/Yukkitsune/workspace/tasks/lab03/solver_lib /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib /home/kitsune/Yukkitsune/workspace/tasks/lab03/_build/solver_lib/CMakeFiles/solver.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : solver_lib/CMakeFiles/solver.dir/depend

