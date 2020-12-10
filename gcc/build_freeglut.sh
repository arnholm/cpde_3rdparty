#!/bin/bash
#  This procedure builds static freeGLUT library for linux
#
mkdir ../libs
pushd ../libs
git clone https://github.com/dcnieho/freeGLUT
git checkout tags/FG_3_2_1
pushd freeGLUT
pushd freeglut
pushd freeglut
cmake -B ../../build \
    -DFREEGLUT_BUILD_STATIC_LIBS:BOOL="1" \
    -DFREEGLUT_BUILD_DEMOS:BOOL="0" \
    -DFREEGLUT_PRINT_WARNINGS:BOOL="0" \
    -DINSTALL_PDB:BOOL="0" \
    -DFREEGLUT_BUILD_SHARED_LIBS:BOOL="1" \
    -DFREEGLUT_PRINT_ERRORS:BOOL="0" 
pushd ../../build
make
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== freeGLUT build completed =====