#!/bin/env bash

source "$(dirname $0)/../functions.sh"

install_yaourt() {
  tmp=$(mktemp -d)

  (
    cd "$tmp"
    for r in package-query yaourt; do
      git clone "https://aur.archlinux.org/$r.git"
      (cd "$r" && makepkg -is)
    done
  )
}

packages_list() {
  cat "$dot/packages/$1" | grep -v '^#'
}

install_packages_debian() {
  sudo apt install $(packages_list packages.debian)
}

install_packages_archlinux() {
  sudo pacman-key --init
  sudo pacman-key --popuplate archlinux
  sudo pacman -S $(packages_list packages.pacman)

  install_yaourt
  yaourt --noconfirm -S $(packages_list packages.aur)
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
