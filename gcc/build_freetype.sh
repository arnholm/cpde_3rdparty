#!/bin/bash
#  This procedure builds static freetype library for linux
#
mkdir -p ../gcclibs
pushd ../gcclibs
git clone https://github.com/freetype/freetype2 
pushd freetype2
git checkout tags/VER-2-10-2
cmake -B build \
    -D CMAKE_DISABLE_FIND_PACKAGE_ZLIB=TRUE \
    -D CMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE \
    -D CMAKE_DISABLE_FIND_PACKAGE_PNG=TRUE \
    -D CMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=TRUE \
    -D CMAKE_DISABLE_FIND_PACKAGE_BrotliDec=TRUE 
pushd build
make
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== freetype build completed =====
