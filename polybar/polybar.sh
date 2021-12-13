#!/bin/env bash

source "$(dirname $0)/../functions.sh"

mkdir -p "$config/polybar"
ln -s "$dot/polybar/launch.sh" "$config/polybar/launch.sh"
ln -s "$dot/polybar/polybar.ini" "$config/polybar/config"
ln -s "$dot/polybar/modules" "$config/polybar/modules"

mkdir -p "$config/polybar/scripts"
for script in "$dot"/polybar/scripts/*; do ln -s "$script" "$config/polybar/scripts"; done

ln -s "$dot/polybar/polybar-config.sh" "$dest/.local/bin"
ln -s "$dot/polybar/launch.sh" "$dest/.local/bin/polybar.sh"

ln -s "$dot/polybar/polybar.service" "$config/systemd/user"
systemctl --user daemon-reload
systemctl --user enable polybar
