#!/bin/bash
#
# Script to build the wxWidgets static library
#
# does exclude some rarely used stuff
#
#
# BUILDNAME="--with-flavour=WXAC"
# change =no to =yes or omit =no to include in build
XTIFF="--with-libtiff=no"
XJPEG="--with-libjpeg=yes"
# CPDE         uses static  linking:   -enable-shared=no 
# Code::Blocks uses dynamic linking:   -enable-shared=yes 
SHARED="--enable-shared=no"

# put here things to explicitely enable
ENABLE="--with-gtk=2 --with-opengl --enable-unicode --enable-dnd --enable-dataobj --enable-graphics-ctx"

# put here things to explicitely disable
DISABLE="--enable-iff=no --enable-tga=no --enable-pcx=no --enable-mediactrl=no --enable-dialupman=no --with-libmspack=no"

# argument can be D for debug version
if [ "$1" = "D" ] ; 
then
  DEB="--enable-debug"
else
  DEB="--enable-debug=no"
fi


# here starts the configure
../configure  ${ENABLE} ${DISABLE} ${SHARED}  ${XJPEG} ${XTIFF} ${DEB}
if [ $? != 0 ]; then exit -1 ; fi

make
if [ $? != 0 ]; then exit -1 ; fi

sudo make install
if [ $? != 0 ]; then exit -1 ; fi

sudo ldconfig
if [ $? != 0 ]; then exit -1 ; fi
