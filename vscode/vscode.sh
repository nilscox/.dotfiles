#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

vscode_dir="$config/Code"

extensions=(
  zhuangtongfa.material-theme # one dark pro
  pkief.material-icon-theme
  anjali.clipboard-history
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  ms-azuretools.vscode-docker
  sleistner.vscode-fileutils
  visualstudioexptteam.vscodeintellicode
  eamodio.gitlens
  mikestead.dotenv
  formulahendry.auto-rename-tag
  cardinal90.multi-cursor-case-preserve
  dbankier.vscode-quick-select
  dcasella.i3
  bradlc.vscode-tailwindcss
  streetsidesoftware.code-spell-checker
  streetsidesoftware.code-spell-checker-french
  bungcip.better-toml
  hangxingliu.vscode-systemd-support
  csstools.postcss
  # ms-vsliveshare.vsliveshare
  # usernamehw.find-jump
  # stkb.rewrap
  # graphql.vscode-graphql
)

# https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
if [ $distrib == 'fedora' ]; then
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

  dnf check-update
  sudo dnf install code
fi

mkdir -p "$vscode_dir/User"

ln -sf "$dot/vscode/settings.json" "$vscode_dir/User"
ln -sf "$dot/vscode/keybindings.json" "$vscode_dir/User"
ln -sf "$dot/vscode/snippets" "$vscode_dir/User"

for ext in "${extensions[@]}"; do
  code --install-extension "$ext"
done
