#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  ln -sf "$DOT/xorg/xinitrc" "$DEST/.xinitrc"

  sudo mkdir -p "/etc/X11/xorg.conf.d"

  sudo cp "$DOT/xorg/00-keyboard.conf" "/etc/X11/xorg.conf.d"
  sudo cp "$DOT/xorg/10-video.conf" "/etc/X11/xorg.conf.d"
  sudo cp "$DOT/xorg/30-touchpad.conf" "/etc/X11/xorg.conf.d"
}

run_uninstall() {
  rm -f "$DEST/.xinitrc"
  sudo rm -f "/etc/X11/xorg.conf.d/*.conf"
}
