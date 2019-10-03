#!/usr/bin/env bash

wid=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
wname=$(xprop -id "$wid" | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
test "$wname" != "scratchpad" && exit 0

y="22"
width="660"

rect=$(i3-msg -t get_tree | jq -r '.nodes[] | select([recurse(.nodes[]?, .floating_nodes[]?) | .focused] | any) | .rect')
scrn_x=$(echo "$rect" | jq -r '.x')
scrn_width=$(echo "$rect" | jq -r '.width')
scrn_height=$(echo "$rect" | jq -r '.height')

x=$(($scrn_x + $scrn_width - $width))
height=$(($scrn_height - $y))

i3-msg resize set "$width" px "$height" px \
  && i3-msg move absolute position "$x" px "$y" px

#sway resize set width "$width" px height "$height" px \
#  && sway move absolute "$x" px "$y" px
