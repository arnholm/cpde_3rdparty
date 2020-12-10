# cpde_3rdparty/gcc

Here are build scripts for 3rd party libraries under Linux/gcc

## Prerequisites

git and cmake must be installed

    sudo apt-get install git
    sudo apt-get install cmake

## Building the components

Designate a build area on the computer, with at least 10GB free space (20GB recommended). Then clone the build scripts

    $ git clone https://github.com/arnholm/cpde_3rdparty
    
Open a terminal in the msvc folder and run each script. Each script adds its build files to the libs folder:

    cpde_3rdparty/libs/boost
                      /wx
                      /carve
                      /..
                      
### wx (wxWidgets)

    $ build_wx.sh

### msgpack

    $ build_msgpack.sh

### boost

    $ build_boost.sh

### carve

    $ build_carve.sh
    
### freeglut

    $ build_freeglut.sh

### freetype

    $ build_freetype.sh
