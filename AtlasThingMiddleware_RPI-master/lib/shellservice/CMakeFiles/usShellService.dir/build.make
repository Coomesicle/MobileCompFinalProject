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
include shellservice/CMakeFiles/usShellService.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include shellservice/CMakeFiles/usShellService.dir/compiler_depend.make

# Include the progress variables for this target.
include shellservice/CMakeFiles/usShellService.dir/progress.make

# Include the compile flags for this target's objects.
include shellservice/CMakeFiles/usShellService.dir/flags.make

shellservice/usShellService/cppmicroservices_resources.cpp: shellservice/usShellService/res.zip
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Checking resource dependencies for usShellService"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/cmake -E copy /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/cmake/CMakeResourceDependencies.cpp /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/cppmicroservices_resources.cpp

shellservice/usShellService/res.zip: shellservice/usShellService/res_0.zip
shellservice/usShellService/res.zip: shellservice/usShellService/res_1.zip
shellservice/usShellService/res.zip: bin/usResourceCompiler4
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Creating resources zip file for usShellService"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && ../bin/usResourceCompiler4 -o /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/res.zip -n dummy -z /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/res_0.zip -z /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/res_1.zip

shellservice/usShellService/res_0.zip: /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/resources/manifest.json
shellservice/usShellService/res_0.zip: /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/resources/ShellProcedures.scm
shellservice/usShellService/res_0.zip: bin/usResourceCompiler4
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Checking resource dependencies for usShellService"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/resources && /usr/bin/cmake -E make_directory /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/resources && /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/bin/usResourceCompiler4 -o /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/res_0.zip -n usShellService -r manifest.json -r ShellProcedures.scm

shellservice/usShellService/res_1.zip: shellservice/resources/tinyscheme/init.scm
shellservice/usShellService/res_1.zip: bin/usResourceCompiler4
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Checking resource dependencies for usShellService"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/resources && /usr/bin/cmake -E make_directory /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/resources && /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/bin/usResourceCompiler4 -o /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/res_1.zip -n usShellService -r tinyscheme/init.scm

shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o: shellservice/CMakeFiles/usShellService.dir/flags.make
shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o: /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellActivator.cpp
shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o: shellservice/CMakeFiles/usShellService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o -MF CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o.d -o CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o -c /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellActivator.cpp

shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/usShellService.dir/src/ShellActivator.cpp.i"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellActivator.cpp > CMakeFiles/usShellService.dir/src/ShellActivator.cpp.i

shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/usShellService.dir/src/ShellActivator.cpp.s"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellActivator.cpp -o CMakeFiles/usShellService.dir/src/ShellActivator.cpp.s

shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.o: shellservice/CMakeFiles/usShellService.dir/flags.make
shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.o: /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellService.cpp
shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.o: shellservice/CMakeFiles/usShellService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.o"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.o -MF CMakeFiles/usShellService.dir/src/ShellService.cpp.o.d -o CMakeFiles/usShellService.dir/src/ShellService.cpp.o -c /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellService.cpp

shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/usShellService.dir/src/ShellService.cpp.i"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellService.cpp > CMakeFiles/usShellService.dir/src/ShellService.cpp.i

shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/usShellService.dir/src/ShellService.cpp.s"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice/src/ShellService.cpp -o CMakeFiles/usShellService.dir/src/ShellService.cpp.s

shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o: shellservice/CMakeFiles/usShellService.dir/flags.make
shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o: /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/tinyscheme/scheme.c
shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o: shellservice/CMakeFiles/usShellService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS)   -Wno-switch -MD -MT shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o -MF CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o.d -o CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o -c /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/tinyscheme/scheme.c

shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.i"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS)   -Wno-switch -E /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/tinyscheme/scheme.c > CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.i

shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.s"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS)   -Wno-switch -S /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/third_party/tinyscheme/scheme.c -o CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.s

shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o: shellservice/CMakeFiles/usShellService.dir/flags.make
shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o: shellservice/usShellService/cppmicroservices_init.cpp
shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o: shellservice/CMakeFiles/usShellService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o -MF CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o.d -o CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o -c /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/cppmicroservices_init.cpp

shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.i"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/cppmicroservices_init.cpp > CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.i

shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.s"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/cppmicroservices_init.cpp -o CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.s

shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o: shellservice/CMakeFiles/usShellService.dir/flags.make
shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o: shellservice/usShellService/cppmicroservices_resources.cpp
shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o: shellservice/CMakeFiles/usShellService.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o -MF CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o.d -o CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o -c /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/cppmicroservices_resources.cpp

shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.i"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/cppmicroservices_resources.cpp > CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.i

shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.s"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/cppmicroservices_resources.cpp -o CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.s

# Object files for target usShellService
usShellService_OBJECTS = \
"CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o" \
"CMakeFiles/usShellService.dir/src/ShellService.cpp.o" \
"CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o" \
"CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o" \
"CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o"

# External object files for target usShellService
usShellService_EXTERNAL_OBJECTS = \
"/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/util/CMakeFiles/util.dir/src/BundleObjFactory.cpp.o" \
"/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/util/CMakeFiles/util.dir/src/BundleObjFile.cpp.o" \
"/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/util/CMakeFiles/util.dir/src/Error.cpp.o" \
"/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/util/CMakeFiles/util.dir/src/FileSystem.cpp.o" \
"/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/util/CMakeFiles/util.dir/src/String.cpp.o"

lib/libusShellServiced.so.0.1.0: shellservice/CMakeFiles/usShellService.dir/src/ShellActivator.cpp.o
lib/libusShellServiced.so.0.1.0: shellservice/CMakeFiles/usShellService.dir/src/ShellService.cpp.o
lib/libusShellServiced.so.0.1.0: shellservice/CMakeFiles/usShellService.dir/__/third_party/tinyscheme/scheme.c.o
lib/libusShellServiced.so.0.1.0: shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_init.cpp.o
lib/libusShellServiced.so.0.1.0: shellservice/CMakeFiles/usShellService.dir/usShellService/cppmicroservices_resources.cpp.o
lib/libusShellServiced.so.0.1.0: util/CMakeFiles/util.dir/src/BundleObjFactory.cpp.o
lib/libusShellServiced.so.0.1.0: util/CMakeFiles/util.dir/src/BundleObjFile.cpp.o
lib/libusShellServiced.so.0.1.0: util/CMakeFiles/util.dir/src/Error.cpp.o
lib/libusShellServiced.so.0.1.0: util/CMakeFiles/util.dir/src/FileSystem.cpp.o
lib/libusShellServiced.so.0.1.0: util/CMakeFiles/util.dir/src/String.cpp.o
lib/libusShellServiced.so.0.1.0: shellservice/CMakeFiles/usShellService.dir/build.make
lib/libusShellServiced.so.0.1.0: lib/libCppMicroServicesd.so.4.0.0
lib/libusShellServiced.so.0.1.0: shellservice/CMakeFiles/usShellService.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX shared library ../lib/libusShellServiced.so"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/usShellService.dir/link.txt --verbose=$(VERBOSE)
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && $(CMAKE_COMMAND) -E cmake_symlink_library ../lib/libusShellServiced.so.0.1.0 ../lib/libusShellServiced.so.0.1.0 ../lib/libusShellServiced.so
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Appending zipped resources to usShellService"
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice && /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/bin/usResourceCompiler4 -b /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/lib/libusShellServiced.so.0.1.0 -z /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/usShellService/res.zip

lib/libusShellServiced.so: lib/libusShellServiced.so.0.1.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libusShellServiced.so

# Rule to build all files generated by this target.
shellservice/CMakeFiles/usShellService.dir/build: lib/libusShellServiced.so
.PHONY : shellservice/CMakeFiles/usShellService.dir/build

shellservice/CMakeFiles/usShellService.dir/clean:
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice && $(CMAKE_COMMAND) -P CMakeFiles/usShellService.dir/cmake_clean.cmake
.PHONY : shellservice/CMakeFiles/usShellService.dir/clean

shellservice/CMakeFiles/usShellService.dir/depend: shellservice/usShellService/cppmicroservices_resources.cpp
shellservice/CMakeFiles/usShellService.dir/depend: shellservice/usShellService/res.zip
shellservice/CMakeFiles/usShellService.dir/depend: shellservice/usShellService/res_0.zip
shellservice/CMakeFiles/usShellService.dir/depend: shellservice/usShellService/res_1.zip
	cd /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/CppMicroServices-development/shellservice /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice /home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/shellservice/CMakeFiles/usShellService.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : shellservice/CMakeFiles/usShellService.dir/depend
