#!/bin/env bash

source "$DOT/setup/functions.sh"

i3="$DOT/i3"
i3blocks="$DOT/i3blocks"
blocklets="$CONFIG/i3blocks-blocklets"
i3blocks_contrib="$CONFIG/i3blocks-contrib"

run_install() {
  ln -sf "$i3" "$CONFIG"
  ln -sf "$i3blocks" "$CONFIG"

  clone_or_pull "git://github.com/vivien/i3blocks-contrib.git" "$i3blocks_contrib"

  mkdir -p "$blocklets"

  ln -sf "$i3blocks_contrib/batterybar/batterybar" "$blocklets"
  ln -sf "$i3blocks_contrib/cpu_usage/cpu_usage" "$blocklets"
  ln -sf "$i3blocks_contrib/iface/iface" "$blocklets"
  ln -sf "$i3blocks_contrib/mediaplayer/mediaplayer" "$blocklets"
  ln -sf "$i3blocks_contrib/memory/memory" "$blocklets"
  ln -sf "$i3blocks_contrib/volume/volume" "$blocklets"
}

run_uninstall() {
  rm -rf "$CONFIG/i3"
  rm -rf "$CONFIG/i3blocks"
  rm -rf "$i3blocks_contrib"
}
