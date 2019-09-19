#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  clone_or_pull "git://github.com/robbyrussell/oh-my-zsh.git" "$DEST/.oh-my-zsh"

  ln -sf "$DOT/zsh/zshrc" "$DEST/.zshrc"
  ln -sf "$DOT/zsh/oh-my-zshrc" "$DEST/.oh-my-zshrc"

  if [ "$DISTRIB" = 'debian' ]; then
    ln -sf "$DOT/zsh/zshrc.debian" "$DEST/.zshrc.debian"
  elif [ "$DISTRIB" = 'arch' ]; then
    ln -sf "$DOT/zsh/zshrc.archlinux" "$DEST/.zshrc.archlinux"
  fi

  chsh -s $(which zsh)
}

run_uninstall() {
  echo "uninstalling some stuff..."
}
