#!/bin/bash

#install build essentials for codeblocks with gtk2 and gtk3
sudo apt install cmake
sudo apt install build-essential
sudo apt install libgtk2.0-dev libhunspell-dev libgamin-dev
sudo apt install libwxgtk3.0-gtk3-dev

#path to wxWidgets configuration scripts
WX_CONFIG_DIR=/usr/local/lib/wx/config

#actual wxWidgets configuration to use
#to see alternatives use: find /usr/local/lib/wx/config/*
WX_CONFIG=gtk2-unicode-3.0
WX_CONFIG_FULLPATH="$WX_CONFIG_DIR/$WX_CONFIG"

#build and install paths
CB_DIR=/ssd1/codeblocks
CB_BUILD_PATH="$CB_DIR/$WX_CONFIG/build"
CB_INSTALL_PATH="$CB_DIR/$WX_CONFIG/install"

#create build area
mkdir -p "$CB_BUILD_PATH"
pushd    "$CB_BUILD_PATH"
pwd
git clone https://github.com/obfuscated/codeblocks_sf
cd codeblocks_sf/

#configure, build & install using selected configuration 
./bootstrap
./configure --with-contrib-plugins=all             \
            --with-wx-config="$WX_CONFIG_FULLPATH" \
            --prefix="$CB_INSTALL_PATH"
make
make install
ls -l "$CB_INSTALL_PATH/bin"
popd
