#!/bin/bash

killall -q polybar 2> /dev/null

monitors="eDP-1"

if [ "$SETUP" == 'oa' ]; then
  monitors="DP-1"
fi

if [ "$SETUP" == 'work' ]; then
  monitors=$(xrandr --query | grep " connected" | cut -d" " -f1 | tr '\n' ' ')
fi

echo "top = $BAR_TOP"
echo "bottom = $BAR_BOTTOM"
echo "setup = $SETUP"
echo "monitors = $monitors"

for monitor in $(echo "$monitors"); do
  [ "$BAR_TOP" = 1 ] && MONITOR="$monitor" polybar top 2>&1 | tee -a "/tmp/polybar-top.$monitor.log" >/dev/null & disown
  [ "$BAR_BOTTOM" = 1 ] && MONITOR="$monitor" polybar bottom 2>&1 | tee -a "/tmp/polybar-bottom.$monitor.log" > /dev/null & disown
done
