@echo off
REM  This procedure builds static wxWidgets libraries on Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM
mkdir ..\msvcbuild
pushd ..\msvcbuild
git clone https://github.com/wxWidgets/wxWidgets wx
pushd wx
git checkout tags/v3.0.4
pushd build\msw
REM
REM
REM Below is for MSVC2013, using cross compiler
REM call "%VS120COMNTOOLS%..\..\VC\vcvarsall.bat" x86_amd64
REM
REM Below is for MSVC2019, using native compiler
REM call "%VS160COMNTOOLS%..\..\VC\Auxiliary\Build\vcvarsall.bat" x64
REM
REM ------- make sure foreign makeflags don't interfere (QNX does this)
set MAKEFLAGS=
REM -------
nmake -f makefile.vc TARGET_CPU=amd64 BUILD=release DEBUG_INFO=1 RUNTIME_LIBS=dynamic SHARED=0 
nmake -f makefile.vc TARGET_CPU=amd64 BUILD=debug   DEBUG_INFO=1 RUNTIME_LIBS=dynamic SHARED=0  
REM
REM return to the directory of this batch file
cd %~dp0
echo ==== wxWidgets build completed =====