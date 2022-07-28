#!/usr/bin/env bash

dir="${WALLPAPERS_DIR:-$HOME/.wallpapers}"
[ ! -d "$dir" ] && exit 0

wallpaper="$dir/$(ls "$dir" | sort -R | tail -1)"

# feh --bg-scale "$wallpaper"
sway output '*' bg "$wallpaper" fill
