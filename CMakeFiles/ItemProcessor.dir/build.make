# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/newrishn/Documents/ItemProcessor

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/newrishn/Documents/ItemProcessor

# Include any dependencies generated for this target.
include CMakeFiles/ItemProcessor.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ItemProcessor.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ItemProcessor.dir/flags.make

CMakeFiles/ItemProcessor.dir/main.cpp.o: CMakeFiles/ItemProcessor.dir/flags.make
CMakeFiles/ItemProcessor.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/newrishn/Documents/ItemProcessor/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ItemProcessor.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ItemProcessor.dir/main.cpp.o -c /Users/newrishn/Documents/ItemProcessor/main.cpp

CMakeFiles/ItemProcessor.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ItemProcessor.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/newrishn/Documents/ItemProcessor/main.cpp > CMakeFiles/ItemProcessor.dir/main.cpp.i

CMakeFiles/ItemProcessor.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ItemProcessor.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/newrishn/Documents/ItemProcessor/main.cpp -o CMakeFiles/ItemProcessor.dir/main.cpp.s

# Object files for target ItemProcessor
ItemProcessor_OBJECTS = \
"CMakeFiles/ItemProcessor.dir/main.cpp.o"

# External object files for target ItemProcessor
ItemProcessor_EXTERNAL_OBJECTS =

ItemProcessor: CMakeFiles/ItemProcessor.dir/main.cpp.o
ItemProcessor: CMakeFiles/ItemProcessor.dir/build.make
ItemProcessor: CMakeFiles/ItemProcessor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/newrishn/Documents/ItemProcessor/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ItemProcessor"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ItemProcessor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ItemProcessor.dir/build: ItemProcessor

.PHONY : CMakeFiles/ItemProcessor.dir/build

CMakeFiles/ItemProcessor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ItemProcessor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ItemProcessor.dir/clean

CMakeFiles/ItemProcessor.dir/depend:
	cd /Users/newrishn/Documents/ItemProcessor && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/newrishn/Documents/ItemProcessor /Users/newrishn/Documents/ItemProcessor /Users/newrishn/Documents/ItemProcessor /Users/newrishn/Documents/ItemProcessor /Users/newrishn/Documents/ItemProcessor/CMakeFiles/ItemProcessor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ItemProcessor.dir/depend

