#!/bin/env bash

source "$DOT/setup/functions.sh"

vscode_dir="$CONFIG/Code\ -\ OSS"
if [ ! -f "$vscode_dir" ]; then
  vscode_dir="$CONFIG/Code";
fi

extensions=(
  anjali.clipboard-history
  azemoh.one-monokai
  davidanson.vscode-markdownlint
  dbaeumer.vscode-eslint
  donjayamanne.githistory
  esbenp.prettier-vscode
  jpoissonnier.vscode-styled-components
  ms-azuretools.vscode-docker
  msjsdiag.debugger-for-chrome
  ms-vscode.vscode-typescript-tslint-plugin
  pkief.material-icon-theme
  sashaweiss.block-travel
  sleistner.vscode-fileutils
  visualstudioexptteam.vscodeintellicode
)

run_install() {
  mkdir -p "$vscode_dir"

  ln -sf "$DOT/vscode/settings.json" "$vscode_dir"
  ln -sf "$DOT/vscode/keybindings.json" "$vscode_dir"

  for ext in "${extensions[@]}"; do
    code --install-extension "$ext"
  done
}

run_uninstall() {
  rm -f "$vscode_dir"
}