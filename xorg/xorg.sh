#!/bin/env bash

source "$(dirname $0)/../functions.sh"

ln -s "$dot/xorg/xinitrc" "$dest/.xinitrc"

sudo mkdir -p "$root/etc/X11/xorg.conf.d"

sudo cp "$dot/xorg/00-keyboard.conf" "$root/etc/X11/xorg.conf.d"
sudo cp "$dot/xorg/30-touchpad.conf" "$root/etc/X11/xorg.conf.d"
