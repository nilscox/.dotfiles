#!/usr/bin/env bash

dir="${WALLPAPERS_DIR:-$HOME/.wallpapers}"
[ ! -d "$dir" ] && exit 1

wallpaper="$dir/$(ls "$dir" | sort -R | tail -1)"

sway output '*' bg "$wallpaper" fill
