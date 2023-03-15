#!/bin/bash

CONFIG="$HOME/.dotfiles/waybar/config.jsonc"
STYLES="$HOME/.dotfiles/waybar/styles.css"

trap "killall waybar" EXIT

while true; do
  systemctl --user restart waybar
  inotifywait -e create,modify "$CONFIG" "$STYLES"
done
