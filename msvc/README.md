# cpde_3rdparty / msvc

These are the CPDE build scripts for 3rd party libraries under Windows/MSVC

## Prerequisites

Visual Studio must be installed, free versions ok. Visual Studio 2019 Community Edition is ok. All scripts *must* be run from "Developer Command Prompt for VS 2019" (or equivalent for your compiler).

[git](https://git-scm.com/) and [CMake](https://cmake.org/) must be installed and in user PATH.

## Building the components

Designate a build area on the computer, with at least 10GB free space (20GB recommended). Then clone the build scripts

    $ git clone https://github.com/arnholm/cpde_3rdparty
    
Open a "Developer Command Prompt for VS 2019" (or equivalent) in the msvc folder and run each script. It is also possible to run build_all.cmd to build them all in one go, but running each script separately gives better opportunity to verify the results. Each script adds its build files to the libs folder:

    cpde_3rdparty/libs/boost
                      /wx
                      /carve
                      /..
                      
### wx (wxWidgets)

    build_wx.cmd
    
This script fetches wxWidgets from github and compiles it to static libraries.

Path | Value | Note
 --- | ---   | ---
include | .\libs\wx\include        |  .
lib     | .\libs\wx\lib\vc_x64_lib |  Special link procedure using wx-config

### msgpack

    build_msgpack.cmd
    
This script clones from github. No building is done as it is used as header only.

Path | Value 
 --- | ---   
include | .\libs\msgpack-c\include 


### boost

    build_boost.cmd

This script clones from github and compiles boost into static libraries. This build is quite lengthy and requiring several GB of disk space

Path | Value
 --- | ---  
include | .\libs\boost
lib     | .\libs\boost\stage\lib

### carve

    build_carve.cmd

This script clones from github and compiles carve into static libraries.

Path | Value | Note
 --- | ---  | ---
include | .\libs\carve |  .
lib     | .\libs\carve\build\lib\Release | Release build
lib     | .\libs\carve\build\lib\Debug | Debug build


### freeglut

    build_freeglut.cmd

This script clones from github and compiles freeglut into static and dynamic libraries. 

Path | Value
 --- | ---  
include | .\libs\freeglut
lib     | .\libs\freeglut\build\lib

### freetype

    build_freetype.cmd

This script clones from github and compiles freetype into a static library

Path | Value | Note
 --- | ---  | ---
include | .\libs\freetype |  .
lib     | .\libs\freetype\build\lib\Release | Release build
lib     | .\libs\freetype\build\lib\Debug | Debug build
