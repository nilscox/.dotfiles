#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

clone_or_pull "git://github.com/robbyrussell/oh-my-zsh.git" "$dest/.oh-my-zsh"

ln -s "$dot/zsh/zshrc.sh" "$dest/.zshrc"
ln -s "$dot/zsh/zshrc.dev.sh" "$dest/.zshrc.dev"
ln -s "$dot/zsh/zshrc.xorg.sh" "$dest/.zshrc.xorg"

if [ "$distrib" = 'debian' ]; then
  ln -s "$dot/zsh/zshrc.debian.sh" "$dest/.zshrc.debian"
elif [ "$distrib" = 'arch' ]; then
  ln -s "$dot/zsh/zshrc.archlinux.sh" "$dest/.zshrc.archlinux"
elif [ "$distrib" = 'fedora' ]; then
  ln -s "$dot/zsh/zshrc.fedora.sh" "$dest/.zshrc.fedora"
fi

clone_or_pull https://github.com/junegunn/fzf.git "$dest/.fzf"
"$dest/.fzf/install" --all

chsh -s $(which zsh)

rm -f "$dest/.bash*"
