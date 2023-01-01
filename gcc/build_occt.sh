#!/bin/bash
#  This procedure builds static opencascade (OCCT) library for linux
#
mkdir -p ../gcclibs
pushd ../gcclibs
git clone --branch V7_6_3  https://github.com/Open-Cascade-SAS/OCCT occt
pushd occt
BUILDTYPE="static"
BUILDDIR="./build_${BUILDTYPE}"
INSTALLDIR="../install_${BUILDTYPE}"
cmake -B ${BUILDDIR} \
    -Wno-dev \
    -DINSTALL_DIR_BIN:PATH="bin" \
    -DINSTALL_DIR:PATH=${INSTALLDIR} \
    -DBUILD_LIBRARY_TYPE:STRING=${BUILDTYPE}
pushd ${BUILDDIR}
make
make install
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== opencascade OCCT build completed =====

