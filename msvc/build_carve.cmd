@echo off
REM  This procedure builds static carve library for Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM
mkdir ..\msvcbuild
pushd ..\msvcbuild
git clone https://github.com/arnholm/carve carve
pushd carve
call build_windows_msvc.cmd
popd
popd
echo ==== carve build completed =====