#!/usr/bin/env bash

focused_window_name=$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true).name')

if [ "$focused_window_name" != "scratchpad" ]; then
  exit 0
fi

outputs=$(swaymsg -r -t get_outputs | jq '.[] | select(.focused)')

mode=$(echo "$outputs" | jq '.current_mode')

screen_width=$(echo "$mode" | jq '.width')
screen_height=$(echo "$mode" | jq '.height')

term_width='720'
term_height="$(($screen_height - 38))"

term_x="$(($screen_width - $term_width))"
term_y='0'

swaymsg "resize set width $term_width height $term_height"
swaymsg "move position $term_x $term_y"
