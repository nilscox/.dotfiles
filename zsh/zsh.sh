#!/bin/env bash

source "$DOT/functions.sh"
set -eo pipefail

for file in $(ls "$dot/zsh/configs" | grep -E -v '^(zshrc|env).zsh$'); do
  ln -sf "$dot/zsh/configs/$file" "$config/zsh"
done

ln -sf "$dot/zsh/configs/zshrc.zsh" "$config/zsh/.zshrc"
ln -sf "$dot/zsh/configs/zshenv.zsh" "$config/zsh/.zshenv"
ln -sf "$config/zsh/.zshenv" "$dest/.zshenv"

chsh -s $(which zsh)

rm -f "$dest/.bash*"
