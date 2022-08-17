#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -sf "$dot/vim/vimrc" "$dest/.vimrc"
clone_or_pull 'https://github.com/VundleVim/Vundle.vim.git' "$dest/.vim/bundle/Vundle.vim"

vim +PluginInstall +qall
