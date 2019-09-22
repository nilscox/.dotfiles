#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  ln -sf "$DOT/xorg/xinitrc" "$DEST/.xinitrc"

  sudo mkdir -p "$ROOT/etc/X11/xorg.conf.d"

  sudo cp "$DOT/xorg/00-keyboard.conf" "$ROOT/etc/X11/xorg.conf.d"
  sudo cp "$DOT/xorg/10-video.conf" "$ROOT/etc/X11/xorg.conf.d"
  sudo cp "$DOT/xorg/30-touchpad.conf" "$ROOT/etc/X11/xorg.conf.d"
}

run_uninstall() {
  rm -f "$DEST/.xinitrc"
  sudo rm -f "$ROOT/etc/X11/xorg.conf.d/*.conf"
}
