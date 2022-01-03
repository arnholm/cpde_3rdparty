@echo off
REM  This procedure builds crow for Windows/MSVC
REM
mkdir ..\msvclibs
pushd ..\msvclibs
git clone https://github.com/CrowCpp/Crow.git crow
pushd crow
REM 
REM Crow is a header-only library sp we don't run CMAKE
REM (besides, CMake balks on not being able to find Boost)
REM
REM return to the directory of this batch file
cd %~dp0
echo ==== crow build completed =====