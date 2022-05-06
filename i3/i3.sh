#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

blocklets="$config/i3blocks-blocklets"
i3blocks_contrib="$config/i3blocks-contrib"

mkdir -p "$config/i3" "$config/i3blocks" "$blocklets"

ln -s "$dot/i3/i3.config" "$config/i3/config"
ln -s "$dot/i3/i3blocks.config" "$config/i3blocks/config"

clone_or_pull "git@github.com/vivien/i3blocks-contrib.git" "$i3blocks_contrib"

ln -s "$i3blocks_contrib/mediaplayer/mediaplayer" "$blocklets"
ln -s "$i3blocks_contrib/volume/volume" "$blocklets"
ln -s "$dot/i3/blocklets/ip" "$blocklets"
ln -s "$i3blocks_contrib/iface/iface" "$blocklets"
ln -s "$i3blocks_contrib/battery2/battery2" "$blocklets"
ln -s "$i3blocks_contrib/disk/disk" "$blocklets"
ln -s "$i3blocks_contrib/memory/memory" "$blocklets"
ln -s "$dot/i3/blocklets/load_average3" "$blocklets"
ln -s "$i3blocks_contrib/cpu_usage/cpu_usage" "$blocklets"
ln -s "$dot/i3/blocklets/date" "$blocklets"

ln -s "$dot/i3/move-scratchpad.sh" "$local/bin"
