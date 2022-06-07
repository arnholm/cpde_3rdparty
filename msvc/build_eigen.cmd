@echo off
REM  This procedure builds static eigen for Windows/MSVC
mkdir ..\msvclibs
pushd ..\msvclibs
git clone https://gitlab.com/libeigen/eigen.git
pushd eigen
cd %~dp0
echo ==== msgpack eigen completed =====