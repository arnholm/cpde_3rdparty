@echo off
REM  This procedure builds static freeGLUT library for Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM
mkdir ..\msvcbuild
pushd ..\msvcbuild
git clone https://github.com/dcnieho/freeGLUT
git checkout tags/FG_3_2_1
pushd freeGLUT
pushd freeglut
pushd freeglut
REM
cmake -B ..\..\build ^
    -DFREEGLUT_BUILD_STATIC_LIBS:BOOL="1" ^
    -DFREEGLUT_BUILD_DEMOS:BOOL="0" ^
    -DFREEGLUT_PRINT_WARNINGS:BOOL="0" ^
    -DINSTALL_PDB:BOOL="0" ^
    -DFREEGLUT_BUILD_SHARED_LIBS:BOOL="0" ^
    -DFREEGLUT_PRINT_ERRORS:BOOL="0" 
pushd ..\..\build
msbuild freeglut.sln -target:freeglut_static /p:Platform="x64" /p:Configuration=Release /m
msbuild freeglut.sln -target:freeglut_static /p:Platform="x64" /p:Configuration=Debug /m
dir .\lib\Debug,.\lib\Release
REM return to the directory of this batch file
cd %~dp0
echo freeGLUT build script ended