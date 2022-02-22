#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -sf "$dot/xorg/xinitrc" "$dest/.xinitrc"

sudo mkdir -p "$root/etc/X11/xorg.conf.d"

sudo cp "$dot/xorg/00-keyboard.conf" "$root/etc/X11/xorg.conf.d"
sudo cp "$dot/xorg/30-touchpad.conf" "$root/etc/X11/xorg.conf.d"
