#!/bin/env bash

source "$DOT/setup/functions.sh"

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

run_install() {
  if [ "$DISTRIB" == 'debian' ]; then
    sudo apt install $(cat "$DOT/packages/packages.debian" | grep -v '^#')
  elif [ "$DISTRIB" == 'arch' ]; then
    sudo pacman-key --init
    sudo pacman-key --popuplate archlinux

    sudo pacman -S $(cat "$DOT/packages/packages.pacman" | grep -v '^#')

    install_yaourt
    yaourt --noconfirm -S $(cat "$DOT/packages/packages.aur" | grep -v '^#')
  else
    echo "unknown distribution $DISTRIB; cannot install packages"
    return 1
  fi
}

run_uninstall() {
  true
}
