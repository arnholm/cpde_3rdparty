@echo off
REM  This procedure builds static msgpack for Windows/MSVC
mkdir ..\msvclibs
pushd ..\msvclibs
git clone https://github.com/msgpack/msgpack-c.git 
pushd msgpack-c
git checkout tags/cpp-3.3.0
REM
REM We really only need header files so we don't build
REM
REM cmake -B build ^
REM       -DMSGPACK_CXX11:BOOL="1" ^
REM       -DMSGPACK_BUILD_EXAMPLES:BOOL="0" ^
REM       -DMSGPACK_CXX_ONLY:BOOL="1" ^
REM       -DMSGPACK_BOOST:BOOL="0"
REM msbuild msgpack.sln -target:freetype /p:Platform="x64" /p:Configuration=Release /m
REM msbuild msgpack.sln -target:freetype /p:Platform="x64" /p:Configuration=Debug /m
REM return to the directory of this batch file
cd %~dp0
echo ==== msgpack build completed =====