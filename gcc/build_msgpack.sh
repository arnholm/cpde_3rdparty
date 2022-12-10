#!/bin/bash
#  This procedure builds msgpack-c for linux
#
mkdir -p ../gcclibs
pushd ../gcclibs
git clone https://github.com/msgpack/msgpack-c.git 
pushd msgpack-c
git checkout tags/cpp-3.3.0
#
# We really only need header files so we don't build
#
# cmake -B build \
#       -DMSGPACK_CXX11:BOOL="1" \
#       -DMSGPACK_BUILD_EXAMPLES:BOOL="0" \
#       -DMSGPACK_CXX_ONLY:BOOL="1" \
#       -DMSGPACK_BOOST:BOOL="0"
# make
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== msgpack-c completed =====
