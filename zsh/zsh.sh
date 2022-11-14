#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -s "$dot/zsh/zshrc.sh" "$dest/.zshrc"
ln -s "$dot/zsh/zshrc.dev.sh" "$dest/.zshrc.dev"

if [ "$distrib" = 'debian' ]; then
  ln -s "$dot/zsh/zshrc.debian.sh" "$dest/.zshrc.debian"
elif [ "$distrib" = 'arch' ]; then
  ln -s "$dot/zsh/zshrc.archlinux.sh" "$dest/.zshrc.archlinux"
elif [ "$distrib" = 'fedora' ]; then
  ln -s "$dot/zsh/zshrc.fedora.sh" "$dest/.zshrc.fedora"
fi

ln -s "$dot/zsh/scripts" "$local/scripts"

chsh -s $(which zsh)

rm -f "$dest/.bash*"
