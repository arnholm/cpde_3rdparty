@echo off
REM  This procedure builds static FreeType library for Windows/MSVC
REM  Procedure must be run from "Visual Studio Command Prompt"
REM
mkdir ..\msvcbuild
pushd ..\msvcbuild
git clone https://github.com/freetype/freetype2 
pushd freetype2
git checkout tags/VER-2-10-2
cmake -B build ^
    -D CMAKE_DISABLE_FIND_PACKAGE_ZLIB=TRUE ^
    -D CMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE ^
    -D CMAKE_DISABLE_FIND_PACKAGE_PNG=TRUE ^
    -D CMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=TRUE ^
    -D CMAKE_DISABLE_FIND_PACKAGE_BrotliDec=TRUE 
pushd build
msbuild freetype.sln -target:freetype /p:Platform="x64" /p:Configuration=Release /m
msbuild freetype.sln -target:freetype /p:Platform="x64" /p:Configuration=Debug /m
dir .\Debug,.\Release
popd
echo FreeType build script ended