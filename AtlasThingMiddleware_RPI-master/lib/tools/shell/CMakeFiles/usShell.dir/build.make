# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

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
CMAKE_SOURCE_DIR = /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib

# Include any dependencies generated for this target.
include tools/shell/CMakeFiles/usShell.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tools/shell/CMakeFiles/usShell.dir/compiler_depend.make

# Include the progress variables for this target.
include tools/shell/CMakeFiles/usShell.dir/progress.make

# Include the compile flags for this target's objects.
include tools/shell/CMakeFiles/usShell.dir/flags.make

tools/shell/CMakeFiles/usShell.dir/Shell.cpp.o: tools/shell/CMakeFiles/usShell.dir/flags.make
tools/shell/CMakeFiles/usShell.dir/Shell.cpp.o: /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/tools/shell/Shell.cpp
tools/shell/CMakeFiles/usShell.dir/Shell.cpp.o: tools/shell/CMakeFiles/usShell.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/shell/CMakeFiles/usShell.dir/Shell.cpp.o"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tools/shell/CMakeFiles/usShell.dir/Shell.cpp.o -MF CMakeFiles/usShell.dir/Shell.cpp.o.d -o CMakeFiles/usShell.dir/Shell.cpp.o -c /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/tools/shell/Shell.cpp

tools/shell/CMakeFiles/usShell.dir/Shell.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/usShell.dir/Shell.cpp.i"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/tools/shell/Shell.cpp > CMakeFiles/usShell.dir/Shell.cpp.i

tools/shell/CMakeFiles/usShell.dir/Shell.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/usShell.dir/Shell.cpp.s"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/tools/shell/Shell.cpp -o CMakeFiles/usShell.dir/Shell.cpp.s

tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o: tools/shell/CMakeFiles/usShell.dir/flags.make
tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o: /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/linenoise.c
tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o: tools/shell/CMakeFiles/usShell.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o -MF CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o.d -o CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o -c /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/linenoise.c

tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.i"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/linenoise.c > CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.i

tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.s"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/linenoise.c -o CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.s

# Object files for target usShell
usShell_OBJECTS = \
"CMakeFiles/usShell.dir/Shell.cpp.o" \
"CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o"

# External object files for target usShell
usShell_EXTERNAL_OBJECTS =

bin/usShell4: tools/shell/CMakeFiles/usShell.dir/Shell.cpp.o
bin/usShell4: tools/shell/CMakeFiles/usShell.dir/__/__/third_party/linenoise.c.o
bin/usShell4: tools/shell/CMakeFiles/usShell.dir/build.make
bin/usShell4: lib/libusShellServiced.so.0.1.0
bin/usShell4: lib/libCppMicroServicesd.so.4.0.0
bin/usShell4: tools/shell/CMakeFiles/usShell.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../bin/usShell4"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/usShell.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/shell/CMakeFiles/usShell.dir/build: bin/usShell4
.PHONY : tools/shell/CMakeFiles/usShell.dir/build

tools/shell/CMakeFiles/usShell.dir/clean:
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell && $(CMAKE_COMMAND) -P CMakeFiles/usShell.dir/cmake_clean.cmake
.PHONY : tools/shell/CMakeFiles/usShell.dir/clean

tools/shell/CMakeFiles/usShell.dir/depend:
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/tools/shell /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/tools/shell/CMakeFiles/usShell.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/shell/CMakeFiles/usShell.dir/depend

