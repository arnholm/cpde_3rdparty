@echo off
REM  This procedure builds static pybind11 for Windows/MSVC
REM
mkdir ..\msvclibs
pushd ..\msvclibs
git clone https://github.com/pybind/pybind11
pushd pybind11
REM
REM We really only need header files so we don't build
REM
REM return to the directory of this batch file
cd %~dp0
echo ==== pybind11 build completed =====