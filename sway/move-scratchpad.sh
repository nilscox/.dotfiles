#!/usr/bin/env bash

outputs=$(swaymsg -r -t get_outputs | jq '.[] | select(.focused)')

mode=$(echo "$outputs" | jq '.current_mode')

screen_width=$(echo "$mode" | jq '.width')
screen_height=$(echo "$mode" | jq '.height')

term_width='720'
term_height="$(($screen_height - 33))"

term_x="$(($screen_width - $term_width + 2))"
term_y='0'

swaymsg "resize set width $term_width height $term_height"
swaymsg "move position $term_x $term_y"
