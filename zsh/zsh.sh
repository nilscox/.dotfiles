#!/bin/env bash

source "$(dirname $0)/../functions.sh"

clone_or_pull "git://github.com/robbyrussell/oh-my-zsh.git" "$dest/.oh-my-zsh"

ln -s "$dot/zsh/zshrc" "$dest/.zshrc"
ln -s "$dot/zsh/zshrc.dev.sh" "$dest/.zshrc.dev"
ln -s "$dot/zsh/oh-my-zsh.sh" "$dest/.oh-my-zshrc"

if [ "$distrib" = 'debian' ]; then
  ln -s "$dot/zsh/zshrc.debian" "$dest/.zshrc.debian"
elif [ "$distrib" = 'arch' ]; then
  ln -s "$dot/zsh/zshrc.archlinux" "$dest/.zshrc.archlinux"
fi

clone_or_pull https://github.com/junegunn/fzf.git "$dest/.fzf"
"$dest/.fzf/install" --all

chsh -s $(which zsh)

rm -f "$dest/.bash*"
