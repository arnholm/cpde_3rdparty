#!/bin/bash
#  This procedure builds crow for linux
#  see https://crowcpp.org/getting_started/setup/linux/
#
mkdir -p ../gcclibs
pushd ../gcclibs
git clone https://github.com/CrowCpp/Crow.git crow
pushd crow
mkdir build
pushd build
cmake .. -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== crow build completed =====
