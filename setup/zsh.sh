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

  git clone --depth 1 https://github.com/junegunn/fzf.git "$DEST/.fzf"
  "$DEST/.fzf/install" --all

  chsh -s $(which zsh)
}

run_uninstall() {
  chsh -s $(which bash)

  rm -rf "$DEST/.zshrc"
  rm -rf "$DEST/.oh-my-zshrc"
  rm -rf "$DEST/.zshrc.*"
  rm -rf "$DEST/.oh-my-zsh"
  rm -rf "$DEST/.fzf"
  rm -rf "$DEST/.fzf.zsh"
}
