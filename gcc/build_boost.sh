#!/bin/bash
#  This procedure builds static boost libraries for linux
#
# NOTE: There are issues with being able to link against boost::filesystem,
#       so until that issue is resolved it is suggested to use boost from the the package manager
#
BOOST_USE_APT=true
if [ "$BOOST_USE_APT" = true ] ; then
#  use dynamic libraries from package manager
   sudo apt -y install libboost-dev
   sudo apt -y install libboost-system-dev
   sudo apt -y install libboost-filesystem-dev
   sudo apt -y install libboost-regex-dev
   sudo apt -y install libboost-thread-dev
   sudo apt -y install libboost-program-options-dev
   sudo ldconfig
else
# build static boost libraries from source
   mkdir ../gcclibs
   pushd ../gcclibs
   sudo apt install python3.8-dev
   git clone --recursive https://github.com/boostorg/boost.git  --branch boost-1.74.0  --single-branch
   pushd boost
# 
  ./bootstrap.sh -with-toolset=gcc --with-python-version=3.8
  ./b2 cxxflags="-std=c++11 -fPIC" define=BOOST_SYSTEM_NO_DEPRECATED  address-model=64 architecture=x86 threading=multi  link=static --stagedir=./stage
fi
#
#return to the directory of this script
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== boost completed =====