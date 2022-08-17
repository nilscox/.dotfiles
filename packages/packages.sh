#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

install_yay() {
  sudo pacman -S --needed git base-devel

  tmp=$(mktemp -d)

  (
    cd "$tmp"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -is
  )

  rm -rf "$tmp"
}

packages_list() {
  cat "$dot/packages/$1" | grep -v '^#'
}

install_packages_debian() {
  sudo apt install $(packages_list packages.debian)
}

install_packages_archlinux() {
  sudo pacman-key --init
  sudo pacman-key --populate archlinux
  sudo pacman -S $(packages_list packages.pacman)

  install_yay
  yay -Syy
  yay --noconfirm -S $(packages_list packages.aur)
}

install_packages_fedora() {
  sudo dnf install -y $(packages_list packages.dnf)
}

if [ "$distrib" == 'debian' ]; then
  install_packages_debian
elif [ "$distrib" == 'fedora' ]; then
  install_packages_fedora
elif [ "$distrib" == 'arch' ]; then
  install_packages_archlinux
else
  echo "unknown distribution $distrib, no package to install"
fi
