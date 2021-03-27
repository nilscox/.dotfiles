#!/usr/bin/env bash

source "$(dirname $0)/functions.sh"

ensure_variable GIT_USERNAME
ensure_variable GIT_EMAIL
ensure_variable PCLOUD_EMAIL

echo "root = $root"
echo "dot = $dot"
echo "dest = $dest"
echo "config = $config"
echo "local = $local"
echo "distrib = $distrib"
echo
echo -n "okay? "
read

mkdir -p "$config/systemd/user"
mkdir -p "$dest/.local/bin"

units=(
  packages
  ntp
  autologin
  zsh
  ssh
  git
  node
  xorg
  i3
  imwheel
  wallpaper
  terminator
  rofi
  firefox
  vscode
  pcloud
  vim
)

for unit in "${units[@]}"; do
  script="$(dirname "$0")/$unit/$unit.sh"

  if [ -f "$script" -a -x "$script" ]; then
    echo "* run $unit"
    "$script"
  fi
done
