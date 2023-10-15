@echo off
REM  This procedure builds static boost libraries for Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM  Make sure
REM     - PYTHON_DIR environment variable points to the current dir for 
REM       python version you want to link with 
REM     - User PATH refers to %PYTHON_DIR% and %PYTHON_DIR%\Scripts (b2 appears to use this)
REM     - 'using python' below refers to same Python version number indicated by PYTHON_DIR
REM
mkdir ..\msvclibs
pushd ..\msvclibs
git clone --recursive https://github.com/boostorg/boost.git  --branch boost-1.82.0  --single-branch
pushd boost
REM  MSVC2019: call bootstrap.bat vc142
REM  MSVC2022: call bootstrap.bat vc143
call bootstrap.bat vc143
REM
REM Set address-model=32 for x86 32-bit builds
REM Set address-model=64 for x86_amd64 cross compiler or native amd64 build
REM Set architecture=x86 in all cases
REM
REM Make sure the correct version of python is found
REM
REM replace backslashes in path with forward slashes to avoid 
REM problems in user-config.jam (backslash is escape character)
set "PYTHON_DIR=%PYTHON_DIR:\=/%"
REM
REM echo using python : 3.11 : C:/source/Python/Python311 : ; > user-config.jam
echo using python : 3.11 : %PYTHON_DIR% : ; > user-config.jam
REM 
.\b2 -j8 toolset=msvc  --user-config=user-config.jam address-model=64 architecture=x86 link=static threading=multi runtime-link=shared --build-type=minimal 
REM return to the directory of this batch file
cd %~dp0
echo ==== boost build completed =====

