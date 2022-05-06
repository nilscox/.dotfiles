#!/usr/bin/env bash

wid=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
wname=$(xprop -id "$wid" | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
test "$wname" != "scratchpad" && exit 0

rect=$(i3-msg -t get_tree | jq -r '.nodes[] | select([recurse(.nodes[]?, .floating_nodes[]?) | .focused] | any) | .rect')
scrn_x=$(echo "$rect" | jq -r '.x')
scrn_y=$(echo "$rect" | jq -r '.y')
scrn_width=$(echo "$rect" | jq -r '.width')
scrn_height=$(echo "$rect" | jq -r '.height')

top_bar_height="21"
bottom_bar_height="10"
width="660"
height=$(($scrn_height))

x=$(($scrn_x + $scrn_width - $width + 2))
y=$(($scrn_y))

source "$XDG_RUNTIME_DIR/polybar.env"

if [ "$BAR_TOP" = '1' ]; then
  y=$(($y + "$top_bar_height"))
  height=$(($height - $top_bar_height))
fi

if [ "$BAR_BOTTOM" = '1' ]; then
  height=$(($height - $bottom_bar_height))
fi

i3-msg resize set "$width" px "$height" px \
  && i3-msg move absolute position "$x" px "$y" px

# echo "x = $x"
# echo "x = $x"
# echo "width = $width"
# echo "height = $height"
