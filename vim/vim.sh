#!/bin/env bash

source "$(dirname $0)/../functions.sh"

ln -s "$dot/vim/vimrc" "$dest/.vimrc"
clone_or_pull 'git://github.com/VundleVim/Vundle.vim.git' "$dest/.vim/bundle/Vundle.vim"

vim +PluginInstall +qall
