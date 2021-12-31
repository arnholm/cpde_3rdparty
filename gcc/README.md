# cpde_3rdparty / gcc

These are the CPDE build scripts for 3rd party libraries under  Linux/gcc

## Prerequisites

git and cmake must be installed

    sudo apt-get -y install git git-gui
    sudo apt-get -y install cmake

## Building the components

Designate a build area on the computer, with at least 10GB free space (20GB recommended). Then clone the build scripts

    $ git clone https://github.com/arnholm/cpde_3rdparty
    
Open a terminal in the gcc folder and run each script. Each script adds its build files to the gcclibs folder:

    cpde_3rdparty/gcclibs/boost
                         /wx
                         /carve
                         /..
                      
### wx (wxWidgets)

    $ ./build_wx.sh

*Always* start with this, because it also installs essential build tools.
    
This script fetches wxWidgets from github and compiles it to static libraries and installs it to /usr/local. Note that this script will ask for sudo password several times in order to install.

Path | Value | Note
 --- | ---   | ---
include | /usr/local/include   |  .
lib     | .            |  Special link procedure using wx-config

### msgpack

    $ ./build_msgpack.sh

This script clones from github. No building is done as it is used as header only.

Path | Value 
 --- | ---   
include | ./gcclibs/msgpack-c/include 


### boost

    $ ./build_boost.sh
	 
This script either installs from the linux distribution package manager (sudo apt-get install libbost-dev) or it fetches from gihub and builds from source. See the script for the current state, it is defined by a flag in the script. Sometimes static builds are unable to link with boost::filesystem properly, and that is the reason static builds are not always used.

### carve

    $ ./build_carve.sh
	 
This script clones from github and compiles carve into a static library: libcarve.lib

Path | Value | Note
 --- | ---  | ---
include | ./gcclibs/carve/include |  .
include | ./gcclibs/carve/build/include | .
lib     | ./gcclibs/carve/build/lib | libcarve.a


### Crow

    $ ./build_crow.sh
	 
This script clones from github and compiles Crow
Crow is a header only library, so only include path is required


Path | Value | Note
 --- | ---  | ---
include | ./gcclibs/crow/include |  .

### dotenv (cpp-dotenv)

    $ ./build_dotenv.sh

This script clones from github and compiles dotenv into several static libraries.

To simplify linking this library, all libraries are also merged into a single library 'libdotenv_all.a'


Path | Value | Note
 --- | ---  | ---
include | ./gcclibs/dotenv/include |  .
lib     | ./gcclibs/dotenv/build | libdotenv_all.a
    
### freeglut

    $ ./build_freeglut.sh

This script clones from github and compiles freeglut into a static and dynamic libraries: libglut.a / libglut.so

Path | Value | Note
 --- | ---  | ---
include | ./gcclibs/freeGLUT/freeglut/freeglut/include | .
lib     | ./gcclibs/freeGLUT/build/lib | libglut.a
bin     | ./gcclibs/freeGLUT/build/lib | libglut.so

### freetype

    $ ./build_freetype.sh

This script clones from github and compiles freetype into a static library: libfreetype.a

Path | Value | Note
 --- | ---  | ---
include | ./gcclibs/freetype2/include |  .
lib     | ./gcclibs/freetype2/build | libfreetype.a


### pybind11

    $ ./build_pybind11.sh

This script clones from github. No building is done as it is used as header only.

Path | Value 
 --- | ---   
include | ./gcclibs/pybind11/include 

