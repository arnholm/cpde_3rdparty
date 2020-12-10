#!/bin/bash
#  This procedure builds static carve library for linux
#
mkdir ../gccbuild
pushd ../gccbuild
git clone https://github.com/arnholm/carve carve
pushd carve
./build_linux.sh
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== carve build completed =====