#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  ln -sf "$DOT/vim/vimrc" "$DEST/.vimrc"
  clone_or_pull 'git://github.com/VundleVim/Vundle.vim.git' "$DEST/.vim/bundle/Vundle.vim"
  vim +PluginInstall +qall
}

run_uninstall() {
  rm -rf "$DEST/.vimrc" "$DEST/.vim"
}

