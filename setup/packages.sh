#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  if [ "$DISTRIB" == 'debian' ]; then
    sudo apt install $(cat "$PKG_DIR/packages.debian" | grep -v '^#')
  elif [ "$DISTRIB" == 'arch' ]; then
    sudo pacman -S $(cat "$PKG_DIR/packages.pacman" | grep -v '^#')
    # sudo yaourt -S $(cat "$PKG_DIR/packages.aur" | grep -v '^#')
  else
    echo "unknown distribution $DISTRIB; cannot install packages"
    return 1
  fi
}

run_uninstall() {
  true
}
