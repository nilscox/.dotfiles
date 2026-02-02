#!/usr/bin/env sh

dir="$HOME/.local/share/wallpapers"

if [ ! -d "$dir" ]; then
    echo "Missing $dir directory" >&2
    exit 1
fi

wallpaper="$dir/$(ls "$dir" | sort -R | tail -1)"
echo "$wallpaper"

swaymsg output '*' bg "$wallpaper" fill
