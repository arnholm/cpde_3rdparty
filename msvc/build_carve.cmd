@echo off
REM  This procedure builds static carve library for Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM
mkdir ..\msvclibs
pushd ..\msvclibs
git clone https://github.com/arnholm/carve carve
pushd carve
call build_windows_msvc.cmd
REM return to the directory of this batch file
cd %~dp0
echo ==== carve build completed =====