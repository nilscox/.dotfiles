#!/usr/bin/env bash

sway 'resize set width 720 height 1062'
sway 'move absolute position 1202 18'
exit 0

wid=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
wname=$(xprop -id "$wid" | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
test "$wname" != "scratchpad" && exit 0

rect=$(i3-msg -t get_tree | jq -r '.nodes[] | select([recurse(.nodes[]?, .floating_nodes[]?) | .focused] | any) | .rect')
scrn_x=$(echo "$rect" | jq -r '.x')
scrn_y=$(echo "$rect" | jq -r '.y')
scrn_width=$(echo "$rect" | jq -r '.width')
scrn_height=$(echo "$rect" | jq -r '.height')

bar_height="18"
width="660"
height=$(($scrn_height))

x=$(($scrn_x + $scrn_width - $width))
y=$(($scrn_y))

source "$XDG_RUNTIME_DIR/polybar.env"

if [ "$BAR_TOP" = '1' ]; then
  y=$(($y + "$bar_height"))
  height=$(($height - $bar_height))
fi

if [ "$BAR_BOTTOM" = '1' ]; then
  height=$(($height - $bar_height))
fi

# i3-msg resize set "$width" px "$height" px \
#   && i3-msg move absolute position "$x" px "$y" px

# echo "x = $x"
# echo "x = $x"
# echo "width = $width"
# echo "height = $height"
