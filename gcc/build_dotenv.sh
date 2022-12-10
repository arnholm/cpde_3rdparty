#!/bin/bash
#  This procedure builds cpp-dotenv for linux
#
mkdir -p ../gcclibs
pushd ../gcclibs
git clone https://github.com/arnholm/dotenv-cpp dotenv
# git clone https://github.com/adeharo9/cpp-dotenv dotenv
# pushd dotenv
# mkdir build
# pushd build
# cmake ..
# make
#
# echo ==== dotenv post-build merge =====
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# red=`tput setaf 1`
# green=`tput setaf 2`
# reset=`tput sgr0`
#
# To simplify linking without cmake, 
# merge all static libraries into one, but keep originals
# 
# lib_merged="libdotenv_all.a"
# echo "${green}-- Merging all static libraries into ${lib_merged} ${reset}"
# find . -name "*.a" -print0 | while read -d $'\0' file
# do
#   echo "${green}${lib_merged}${reset} <== ${green}${file}${reset}"
#   ar -rcT  "${lib_merged}" "${file}"
# done
# ranlib ${lib_merged}
# ls $PWD/${lib_merged}
#
#return to the directory of this batch file
SCRIPTPATH=$(dirname $(realpath -s $0))
cd $SCRIPTPATH
echo ==== dotenv build completed =====
