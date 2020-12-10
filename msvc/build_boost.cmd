@echo off
REM  This procedure builds static boost libraries for Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM
mkdir ..\libs
pushd ..\libs
git clone --recursive https://github.com/boostorg/boost.git  --branch boost-1.74.0  --single-branch
pushd boost
REM
call bootstrap.bat vc142
REM
REM Set address-model=32 for x86 32-bit builds
REM Set address-model=64 for x86_amd64 cross compiler or native amd64 build
REM Set architecture=x86 in all cases
REM
REM Make sure the correct version of python is found
echo using python : 3.8 : D:\\cpde_dep\\3rdparty\\python\\python38 : ; > user-config.jam
REM 
.\b2 -j8 toolset=msvc  --user-config=user-config.jam address-model=64 architecture=x86 link=static threading=multi runtime-link=shared --build-type=minimal 
REM return to the directory of this batch file
cd %~dp0
echo " --- boost build ended ---"

