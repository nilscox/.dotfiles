#!/bin/env bash

source "$DOT/setup/functions.sh"

i3_config="$DOT/i3/i3.config"
i3blocks_config="$DOT/i3/i3blocks.config"
blocklets="$CONFIG/i3blocks-blocklets"
i3blocks_contrib="$CONFIG/i3blocks-contrib"

run_install() {
  mkdir -p "$CONFIG/i3" "$CONFIG/i3blocks"

  ln -sf "$i3_config" "$CONFIG/i3/config"
  ln -sf "$i3blocks_config" "$CONFIG/i3blocks/config"

  clone_or_pull "git://github.com/vivien/i3blocks-contrib.git" "$i3blocks_contrib"

  mkdir -p "$blocklets"

  ln -sf "$i3blocks_contrib/batterybar/batterybar" "$blocklets"
  ln -sf "$i3blocks_contrib/cpu_usage/cpu_usage" "$blocklets"
  ln -sf "$i3blocks_contrib/iface/iface" "$blocklets"
  ln -sf "$i3blocks_contrib/mediaplayer/mediaplayer" "$blocklets"
  ln -sf "$i3blocks_contrib/memory/memory" "$blocklets"
  ln -sf "$i3blocks_contrib/volume/volume" "$blocklets"

  ln -sf "$DOT/i3/move-scratchpad.sh" "$DEST/.local/bin"
}

run_uninstall() {
  rm -rf "$CONFIG/i3"
  rm -rf "$CONFIG/i3blocks"
  rm -rf "$i3blocks_contrib"
}
