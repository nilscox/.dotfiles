#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -s "$dot/vim/vimrc" "$dest/.vimrc"
clone_or_pull 'git://github.com/VundleVim/Vundle.vim.git' "$dest/.vim/bundle/Vundle.vim"

vim +PluginInstall +qall
