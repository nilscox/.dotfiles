#!/bin/env bash

source "$DOT/setup/functions.sh"

vscode_dir="$CONFIG/Code\ -\ OSS"

extensions=(
  zhuangtongfa.material-theme
  pkief.material-icon-theme
  anjali.clipboard-history
  davidanson.vscode-markdownlint
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  jpoissonnier.vscode-styled-components
  ms-azuretools.vscode-docker
  msjsdiag.debugger-for-chrome
  ms-vscode.vscode-typescript-tslint-plugin
  sashaweiss.block-travel
  sleistner.vscode-fileutils
  visualstudioexptteam.vscodeintellicode
  formulahendry.auto-rename-tag
  bierner.color-info
)

run_install() {
  mkdir -p "$vscode_dir/User"

  ln -sf "$DOT/vscode/settings.json" "$vscode_dir/User"
  ln -sf "$DOT/vscode/keybindings.json" "$vscode_dir/User"

  for ext in "${extensions[@]}"; do
    code --install-extension "$ext"
  done
}

run_uninstall() {
  rm -f "$vscode_dir"
}
