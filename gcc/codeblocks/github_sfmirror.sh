#!/bin/bash
#
# Unofficial auto-updated GIT mirror of C::B repo in SourceForge. 
# Does NOT accept patches nor pull requests.
#
CB_MIRROR_DIR=/work/codeblocks
cd "$CB_MIRROR_DIR"
#
# ---- original setup -----
#
# sudo apt install -y git
# sudo apt install -y git-svn
#
# git svn clone https://svn.code.sf.net/p/codeblocks/code/trunk codeblocks-code
# git remote add github_sfmirror https://github.com/arnholm/codeblocks_sfmirror.git
# cd codeblocks-code
# git svn rebase
# git push --set-upstream github_sfmirror master
# 
# ---- regular update  -----
cd ./codeblocks-code
git svn rebase
git push github_sfmirror
#
exit 0
