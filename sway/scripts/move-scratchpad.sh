#!/usr/bin/env zsh

focused_window_name=$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true).name')

if [ "$focused_window_name" != "scratchpad" ]; then
  exit 0
fi

screen_width=$(swaymsg -t get_outputs -r | jq '.[] | select(.focused).rect.width')
screen_height=$(swaymsg -t get_outputs -r | jq '.[] | select(.focused).rect.height')

term_width=720
term_height=$(($screen_height-28))

term_x=$(($screen_width - $term_width))
term_y=0

swaymsg resize set $term_width $term_height
swaymsg move position $term_x $term_y
