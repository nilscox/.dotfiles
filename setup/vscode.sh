#!/bin/env bash

source "$DOT/setup/functions.sh"

#vscode_dir="$CONFIG/Code - OSS"
vscode_dir="$CONFIG/Code"

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
  ms-vsliveshare.vsliveshare
)

run_install() {
  mkdir -p "$vscode_dir/User"

  ln -sf "$DOT/vscode/settings.json" "$vscode_dir/User"
  ln -sf "$DOT/vscode/keybindings.json" "$vscode_dir/User"
  ln -sf "$DOT/vscode/snippets" "$vscode_dir/User"

  for ext in "${extensions[@]}"; do
    code --install-extension "$ext"
  done
}

run_uninstall() {
  rm -f "$vscode_dir"
}
