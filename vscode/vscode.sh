#!/bin/env bash

source "$(dirname $0)/../functions.sh"

vscode_dir="$config/Code"

extensions=(
  zhuangtongfa.material-theme
  pkief.material-icon-theme
  anjali.clipboard-history
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  jpoissonnier.vscode-styled-components
  ms-azuretools.vscode-docker
  sashaweiss.block-travel
  sleistner.vscode-fileutils
  visualstudioexptteam.vscodeintellicode
  bierner.color-info
  eamodio.gitlens
  mikestead.dotenv
  mgmcdermott.vscode-language-babel
  adpyke.vscode-sql-formatter
  formulahendry.auto-rename-tag
  ms-vsliveshare.vsliveshare
  usernamehw.find-jump
  cardinal90.multi-cursor-case-preserve
  dbankier.vscode-quick-select
)

mkdir -p "$vscode_dir/User"

ln -sf "$dot/vscode/settings.json" "$vscode_dir/User"
ln -sf "$dot/vscode/keybindings.json" "$vscode_dir/User"
ln -sf "$dot/vscode/snippets" "$vscode_dir/User"

for ext in "${extensions[@]}"; do
  code --install-extension "$ext"
done
