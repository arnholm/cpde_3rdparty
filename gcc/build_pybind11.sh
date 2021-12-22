#!/bin/bash
#  This procedure builds pybind11 for linux
#
mkdir ../gcclibs
pushd ../gcclibs
git clone https://github.com/pybind/pybind11
pushd pybind11
#
# We really only need header files so we don't build
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== pybind11 completed =====
