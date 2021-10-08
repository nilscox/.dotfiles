#!/bin/env bash

source "$(dirname $0)/../functions.sh"

vscode_dir="$config/Code"

extensions=(
  zhuangtongfa.material-theme # one dark pro
  pkief.material-icon-theme
  anjali.clipboard-history
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  jpoissonnier.vscode-styled-components
  ms-azuretools.vscode-docker
  sleistner.vscode-fileutils
  visualstudioexptteam.vscodeintellicode
  eamodio.gitlens
  mikestead.dotenv
  formulahendry.auto-rename-tag
  ms-vsliveshare.vsliveshare
  usernamehw.find-jump
  cardinal90.multi-cursor-case-preserve
  dbankier.vscode-quick-select
  dcasella.i3
  ibm.output-colorizer
  ryanluker.vscode-coverage-gutters
  ms-vscode.vscode-typescript-tslint-plugin
  streetsidesoftware.code-spell-checker
)

mkdir -p "$vscode_dir/User"

ln -sf "$dot/vscode/settings.json" "$vscode_dir/User"
ln -sf "$dot/vscode/keybindings.json" "$vscode_dir/User"
ln -sf "$dot/vscode/snippets" "$vscode_dir/User"

for ext in "${extensions[@]}"; do
  code --install-extension "$ext"
done
