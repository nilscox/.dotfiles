#!/usr/bin/env bash

[ -z "$WALLPAPERS_DIR" ] && WALLPAPERS_DIR="$HOME/.wallpapers"
[ ! -d "$WALLPAPERS_DIR" ] && exit 0

wp="$WALLPAPERS_DIR/$(ls "$WALLPAPERS_DIR" | sort -R | tail -1)"

feh --bg-scale "$wp"
# sway output '*' bg "$wp" fill
