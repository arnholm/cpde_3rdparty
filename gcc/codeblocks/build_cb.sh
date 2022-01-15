#!/bin/bash
# build script for Code::Blocks under Ubuntu
# Script source : https://github.com/arnholm/cpde_3rdparty/blob/master/gcc/codeblocks/build_cb.sh

#install build essentials for codeblocks with gtk2 and gtk3
sudo apt install -y git
sudo apt install -y cmake
sudo apt install -y build-essential
sudo apt install -y libhunspell-dev libgamin-dev
sudo apt install -y libboost-system-dev
sudo apt install -y libtool

#install build packages for codeblocks with gtk2
sudo apt install -y libgtk2.0-dev

#install build packages for codeblocks with gtk3
# sudo apt install -y libgtk-3-devmake
sudo apt install -y libwxgtk3.0-gtk3-0v5 libwxgtk3.0-gtk3-dev

#path to wxWidgets configuration scripts when wxWidgets build locally
WX_CONFIG_DIR=/usr/local/lib/wx/config

#actual wxWidgets configuration to use
#to see alternatives use: find /usr/local/lib/wx/config/*
WX_CONFIG=gtk2-unicode-3.0
WX_CONFIG_FULLPATH="$WX_CONFIG_DIR/$WX_CONFIG"

#build and install paths
CB_DIR=/ssd1/codeblocks
CB_BUILD_DATE="$(date +%Y%m%d)"
CB_BUILD_PATH="$CB_DIR/$WX_CONFIG/$CB_BUILD_DATE/build"
CB_INSTALL_PATH="$CB_DIR/$WX_CONFIG/$CB_BUILD_DATE/install"

#create build area
mkdir -p "$CB_BUILD_PATH"
pushd    "$CB_BUILD_PATH"
pwd
# git clone https://github.com/obfuscated/codeblocks_sf
# cd codeblocks_sf/
git clone https://github.com/arnholm/codeblocks_sfmirror 
cd codeblocks_sfmirror

#configure, build & install using selected configuration 
./bootstrap
./configure --with-contrib-plugins=all             \
            --with-wx-config="$WX_CONFIG_FULLPATH" \
            --prefix="$CB_INSTALL_PATH"
make
make install
ls -l "$CB_INSTALL_PATH/bin"
popd
