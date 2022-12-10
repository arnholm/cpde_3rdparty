#!/bin/bash
#  This procedure builds static wxWidgets library for linux
#  The library is installed to /usr/local
#  NOTE: The user is prompted for password (twice) to allow install
#
SCRIPTPATH=$(dirname $(realpath -s $0))
mkdir -p ../gcclibs
pushd ../gcclibs
#
# Install essential build tools and libraries
#
sudo apt install cmake
sudo apt install build-essential
sudo apt install libgtk2.0-dev libhunspell-dev libgamin-dev
sudo apt install libwxgtk3.0-gtk3-dev
sudo apt install mesa-common-dev
sudo apt install freeglut3-dev
sudo apt install upx-ucl
#
# clone wxWidgets and all submodules
git clone --recursive --depth 1 --branch v3.0.4  https://github.com/wxWidgets/wxWidgets wx
pushd wx
# git checkout tags/v3.0.4
#git checkout tags/v3.1.5
#
# build Release
mkdir buildgtk
pushd buildgtk
cp $SCRIPTPATH/internal/buildWxWidgets.sh .
./buildWxWidgets.sh
popd
#
# build Debug
mkdir buildgtkd
pushd buildgtkd
cp $SCRIPTPATH/internal/buildWxWidgets.sh .
./buildWxWidgets.sh D
popd
#
#return to the directory of this batch file
cd $SCRIPTPATH
echo ==== wx build completed =====
