# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

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
CMAKE_SOURCE_DIR = /home/hinpa/GameEngine2/dependencies/glfw_lib/glfw

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hinpa/GameEngine2/dependencies/glfw_lib/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/cursor.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/cursor.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/cursor.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/cursor.dir/flags.make

tests/CMakeFiles/cursor.dir/cursor.c.o: tests/CMakeFiles/cursor.dir/flags.make
tests/CMakeFiles/cursor.dir/cursor.c.o: /home/hinpa/GameEngine2/dependencies/glfw_lib/glfw/tests/cursor.c
tests/CMakeFiles/cursor.dir/cursor.c.o: tests/CMakeFiles/cursor.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/hinpa/GameEngine2/dependencies/glfw_lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/cursor.dir/cursor.c.o"
	cd /home/hinpa/GameEngine2/dependencies/glfw_lib/build/tests && /usr/sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tests/CMakeFiles/cursor.dir/cursor.c.o -MF CMakeFiles/cursor.dir/cursor.c.o.d -o CMakeFiles/cursor.dir/cursor.c.o -c /home/hinpa/GameEngine2/dependencies/glfw_lib/glfw/tests/cursor.c

tests/CMakeFiles/cursor.dir/cursor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cursor.dir/cursor.c.i"
	cd /home/hinpa/GameEngine2/dependencies/glfw_lib/build/tests && /usr/sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hinpa/GameEngine2/dependencies/glfw_lib/glfw/tests/cursor.c > CMakeFiles/cursor.dir/cursor.c.i

tests/CMakeFiles/cursor.dir/cursor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cursor.dir/cursor.c.s"
	cd /home/hinpa/GameEngine2/dependencies/glfw_lib/build/tests && /usr/sbin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hinpa/GameEngine2/dependencies/glfw_lib/glfw/tests/cursor.c -o CMakeFiles/cursor.dir/cursor.c.s

# Object files for target cursor
cursor_OBJECTS = \
"CMakeFiles/cursor.dir/cursor.c.o"

# External object files for target cursor
cursor_EXTERNAL_OBJECTS =

tests/cursor: tests/CMakeFiles/cursor.dir/cursor.c.o
tests/cursor: tests/CMakeFiles/cursor.dir/build.make
tests/cursor: src/libglfw.so.3.5
tests/cursor: /mnt/c/msys64/mingw64/lib/libm.a
tests/cursor: tests/CMakeFiles/cursor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/hinpa/GameEngine2/dependencies/glfw_lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable cursor"
	cd /home/hinpa/GameEngine2/dependencies/glfw_lib/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cursor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/cursor.dir/build: tests/cursor
.PHONY : tests/CMakeFiles/cursor.dir/build

tests/CMakeFiles/cursor.dir/clean:
	cd /home/hinpa/GameEngine2/dependencies/glfw_lib/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/cursor.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/cursor.dir/clean

tests/CMakeFiles/cursor.dir/depend:
	cd /home/hinpa/GameEngine2/dependencies/glfw_lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hinpa/GameEngine2/dependencies/glfw_lib/glfw /home/hinpa/GameEngine2/dependencies/glfw_lib/glfw/tests /home/hinpa/GameEngine2/dependencies/glfw_lib/build /home/hinpa/GameEngine2/dependencies/glfw_lib/build/tests /home/hinpa/GameEngine2/dependencies/glfw_lib/build/tests/CMakeFiles/cursor.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/cursor.dir/depend

