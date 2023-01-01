@echo off
REM  This procedure builds static opencascade (OCCT) library for Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM
mkdir ..\msvclibs
pushd ..\msvclibs
git clone --branch V7_6_3  https://github.com/Open-Cascade-SAS/OCCT occt
pushd occt
set BUILDTYPE=static
set BUILDDIR=.\build_%BUILDTYPE%
set INSTALLDIR=..\install_%BUILDTYPE%
REM Note that '^' must be the last character on each line
cmake -B "%BUILDDIR%" ^
   -Wno-dev ^
   -DBUILD_MODULE_Visualization:BOOL="0" ^
   -DUSE_OPENGL:BOOL="0" ^
   -DUSE_TK:BOOL="0" ^
   -DBUILD_MODULE_Draw:BOOL="0" ^
   -DUSE_FREETYPE:BOOL="0" ^
   -DINSTALL_DIR_BIN:PATH="bin" ^
   -DINSTALL_DIR:PATH="%INSTALLDIR%" ^
   -DBUILD_LIBRARY_TYPE:STRING="%BUILDTYPE%"   
pushd %BUILDDIR%
msbuild OCCT.sln        /p:Platform="x64" /p:Configuration=Release /m
msbuild INSTALL.vcxproj /p:Platform="x64" /p:Configuration=Release /m
REM Create monolithic library on lib folder
pushd %INSTALLDIR%
mkdir lib
pushd lib
lib /out:occt_monolithic.lib ..\win64\vc14\lib\*.lib
REM
REM return to the directory of this batch file
cd %~dp0
echo opencascade OCCT build script ended