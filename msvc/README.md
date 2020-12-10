# cpde_3rdparty/msvc

Here are build scripts for 3rd party libraries under Windows/MSVC

## Prerequisites

Visual Studio must be installed, free versions ok. Visual Studio 2019 Community Edition is ok. All scripts *must* be run from "Developer Command Prompt for VS 2019" (or equivalent for your compiler).

git - https://git-scm.com/ - must be installed and in user PATH.
CMake - https://cmake.org/ - must be installed and in user PATH.

## Building the components

Designate a build area on the computer, with at least 10GB free space (20GB recommended). Then clone the build scripts

    $ git clone https://github.com/arnholm/cpde_3rdparty
    
Open a terminal in the msvc folder and run each script. It is also possible to run build_all.cmd to build them all in one go, but running each script separately gives better opportunity to verify the results. Each script adds its build files to the libs folder:

    cpde_3rdparty/libs/boost
                      /wx
                      /carve
                      /..
                      
### wx (wxWidgets)

    $ build_wx.cmd

### msgpack

    $ build_msgpack.cmd

### boost

    $ build_boost.cmd

### carve

    $ build_carve.cmd
    
### freeglut

    $ build_freeglut.cmd

### freetype

    $ build_freetype.cmd

