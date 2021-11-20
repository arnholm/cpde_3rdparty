# cpde_3rdparty / gcc / codeblocks

## default.conf

This is a Code::Blocks configuration file for linux with some prededfined assigment of global variables. It assumes that this repository (cpde_3rdparty) has been cloned to the user home directory

    ~/cpde_3rdparty
    
It is also assumed the build scripts have been executed successfully so that the following folder exists

    ~/cpde_3rdparty/gcclibs
    
To install codeblocks and the configuration file, do

    sudo apt install -y codeblocks codeblocks-contrib
    
Open codeblocks and exit, to generate a default configuration in

    ~/.config/codeblocks/default.conf
    
Copy the provided default.conf over the generated file. Then restart codeblocks and check global variables.


## build_cb.sh

This is a Code::Blocks build script that clones the C::B source code from a github mirror repository and builds the binaries. Note that the variable CB_DIR in that script may have to be adjusted to define the root build & install folder.


## github_sfmirror.sh

This is a script for regular mirroring of Code::Blocs SVN repository to a github mirror. Note that the variable CB_MIRROR_DIR in that script defines the local directory of the SVN clone.
