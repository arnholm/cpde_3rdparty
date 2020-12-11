# cpde_3rdparty / gcc / codeblocks

    default.conf

This is a Code::Blocks configuration file for linux with some prededfined assigment of global variables. It assumes that this repository (cpde_3rdparty) has been cloned from the user home directry

    ~/cpde_3rdparty
    
It is also assumed the build scripts have been executed successfully so that the following folder exists

    ~/cpde_3rdparty/gcclibs
    
To install codeblocks and the configuration file, do

    sudo apt install -y codeblocks codeblocks-contrib
    
Open codeblocks and exit, to generate a default configuration in

    ~/.config/codeblocks/default.conf
    
Copy the provided default.conf over the generated file. Then restart codeblocks and check global variables.
