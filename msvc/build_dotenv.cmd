@echo off
REM  This procedure builds dotenv for Windows/MSVC
REM
mkdir ..\msvclibs
pushd ..\msvclibs
git clone https://github.com/arnholm/dotenv-cpp dotenv
REM 
REM dotenv-cpp is a header-only library so nothing to build
REM
REM return to the directory of this batch file
REM cd %~dp0
echo ==== crow build completed =====