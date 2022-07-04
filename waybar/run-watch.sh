#!/bin/bash

CONFIG="$HOME/.dotfiles/waybar/config.jsonc"
STYLES="$HOME/.dotfiles/waybar/styles.css"

trap "killall waybar" EXIT

while true; do
  waybar -c "$CONFIG" -s "$STYLES" &
  inotifywait -e create,modify "$CONFIG" "$STYLES"
  killall waybar
done
