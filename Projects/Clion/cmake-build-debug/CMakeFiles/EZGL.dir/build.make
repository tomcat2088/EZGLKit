# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/EZGL.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/EZGL.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/EZGL.dir/flags.make

CMakeFiles/EZGL.dir/main.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/EZGL.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/main.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/main.cpp"

CMakeFiles/EZGL.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/main.cpp" > CMakeFiles/EZGL.dir/main.cpp.i

CMakeFiles/EZGL.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/main.cpp" -o CMakeFiles/EZGL.dir/main.cpp.s

CMakeFiles/EZGL.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/main.cpp.o.requires

CMakeFiles/EZGL.dir/main.cpp.o.provides: CMakeFiles/EZGL.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/main.cpp.o.provides

CMakeFiles/EZGL.dir/main.cpp.o.provides.build: CMakeFiles/EZGL.dir/main.cpp.o


CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o: ../BaseWindow/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/BaseWindow/main.cpp"

CMakeFiles/EZGL.dir/BaseWindow/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/BaseWindow/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/BaseWindow/main.cpp" > CMakeFiles/EZGL.dir/BaseWindow/main.cpp.i

CMakeFiles/EZGL.dir/BaseWindow/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/BaseWindow/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/BaseWindow/main.cpp" -o CMakeFiles/EZGL.dir/BaseWindow/main.cpp.s

CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.requires

CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.provides: CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.provides

CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.provides.build: CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o


CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o: ../FPS\ Demo2/FGScene.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/FGScene.cpp"

CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/FGScene.cpp" > CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.i

CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/FGScene.cpp" -o CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.s

CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.requires

CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.provides: CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.provides

CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.provides.build: CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o


CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o: ../FPS\ Demo2/FGWindow.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/FGWindow.cpp"

CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/FGWindow.cpp" > CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.i

CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/FGWindow.cpp" -o CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.s

CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.requires

CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.provides: CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.provides

CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.provides.build: CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o


CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o: ../FPS\ Demo2/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/main.cpp"

CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/main.cpp" > CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.i

CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Demo2/main.cpp" -o CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.s

CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.requires

CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.provides: CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.provides

CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.provides.build: CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o


CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o: ../FPS\ Game/FGScene.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/FGScene.cpp"

CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/FGScene.cpp" > CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.i

CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/FGScene.cpp" -o CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.s

CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.requires

CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.provides: CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.provides

CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.provides.build: CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o


CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o: ../FPS\ Game/FGWindow.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/FGWindow.cpp"

CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/FGWindow.cpp" > CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.i

CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/FGWindow.cpp" -o CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.s

CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.requires

CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.provides: CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.provides

CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.provides.build: CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o


CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o: ../FPS\ Game/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/main.cpp"

CMakeFiles/EZGL.dir/FPS_Game/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/FPS_Game/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/main.cpp" > CMakeFiles/EZGL.dir/FPS_Game/main.cpp.i

CMakeFiles/EZGL.dir/FPS_Game/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/FPS_Game/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/FPS Game/main.cpp" -o CMakeFiles/EZGL.dir/FPS_Game/main.cpp.s

CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.requires

CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.provides: CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.provides

CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.provides.build: CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o


CMakeFiles/EZGL.dir/Shader/main.cpp.o: CMakeFiles/EZGL.dir/flags.make
CMakeFiles/EZGL.dir/Shader/main.cpp.o: ../Shader/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/EZGL.dir/Shader/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/EZGL.dir/Shader/main.cpp.o -c "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/Shader/main.cpp"

CMakeFiles/EZGL.dir/Shader/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EZGL.dir/Shader/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/Shader/main.cpp" > CMakeFiles/EZGL.dir/Shader/main.cpp.i

CMakeFiles/EZGL.dir/Shader/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EZGL.dir/Shader/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/Shader/main.cpp" -o CMakeFiles/EZGL.dir/Shader/main.cpp.s

CMakeFiles/EZGL.dir/Shader/main.cpp.o.requires:

.PHONY : CMakeFiles/EZGL.dir/Shader/main.cpp.o.requires

CMakeFiles/EZGL.dir/Shader/main.cpp.o.provides: CMakeFiles/EZGL.dir/Shader/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/EZGL.dir/build.make CMakeFiles/EZGL.dir/Shader/main.cpp.o.provides.build
.PHONY : CMakeFiles/EZGL.dir/Shader/main.cpp.o.provides

CMakeFiles/EZGL.dir/Shader/main.cpp.o.provides.build: CMakeFiles/EZGL.dir/Shader/main.cpp.o


# Object files for target EZGL
EZGL_OBJECTS = \
"CMakeFiles/EZGL.dir/main.cpp.o" \
"CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o" \
"CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o" \
"CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o" \
"CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o" \
"CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o" \
"CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o" \
"CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o" \
"CMakeFiles/EZGL.dir/Shader/main.cpp.o"

# External object files for target EZGL
EZGL_EXTERNAL_OBJECTS =

EZGL: CMakeFiles/EZGL.dir/main.cpp.o
EZGL: CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o
EZGL: CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o
EZGL: CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o
EZGL: CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o
EZGL: CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o
EZGL: CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o
EZGL: CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o
EZGL: CMakeFiles/EZGL.dir/Shader/main.cpp.o
EZGL: CMakeFiles/EZGL.dir/build.make
EZGL: EZGLib/libEZGLib.a
EZGL: /usr/local/lib/libglfw3.a
EZGL: glad/libglad.a
EZGL: soil/libsoil.a
EZGL: wavefront/libwavefront.a
EZGL: bullet/libbullet.a
EZGL: CMakeFiles/EZGL.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable EZGL"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/EZGL.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/EZGL.dir/build: EZGL

.PHONY : CMakeFiles/EZGL.dir/build

CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/main.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/BaseWindow/main.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/FPS_Demo2/FGScene.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/FPS_Demo2/FGWindow.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/FPS_Demo2/main.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/FPS_Game/FGScene.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/FPS_Game/FGWindow.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/FPS_Game/main.cpp.o.requires
CMakeFiles/EZGL.dir/requires: CMakeFiles/EZGL.dir/Shader/main.cpp.o.requires

.PHONY : CMakeFiles/EZGL.dir/requires

CMakeFiles/EZGL.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/EZGL.dir/cmake_clean.cmake
.PHONY : CMakeFiles/EZGL.dir/clean

CMakeFiles/EZGL.dir/depend:
	cd "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion" "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion" "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug" "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug" "/Users/wangyang/Documents/Projects/On Git/EZGLKit/Projects/Clion/cmake-build-debug/CMakeFiles/EZGL.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/EZGL.dir/depend

