#!/usr/bin/env sh

dir="$HOME/.wallpapers"

if [ ! -d "$dir" ]; then
    exit 1
fi

wallpaper="$dir/$(ls "$dir" | sort -R | tail -1)"
echo "$wallpaper"

swaymsg output '*' bg "$wallpaper" fill
