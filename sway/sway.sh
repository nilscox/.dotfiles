#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/sway"

ln -sf "$dot/sway/config.sway" "$config/sway/config"
ln -sf "$dot/sway/config.d" "$config/sway"
ln -sf "$dot/sway/scripts" "$config/sway"

ln -sf "$dot/sway/systemd/sway-session.target" "$config/systemd/user"
ln -sf "$dot/sway/systemd/kanshi.service" "$config/systemd/user"
ln -sf "$dot/sway/systemd/mako.service" "$config/systemd/user"
ln -sf "$dot/sway/systemd/network-manager-applet.service" "$config/systemd/user"
ln -sf "$dot/sway/systemd/wallpaper.service" "$config/systemd/user"
ln -sf "$dot/sway/systemd/wallpaper.timer" "$config/systemd/user"
ln -sf "$dot/sway/systemd/waybar.service" "$config/systemd/user"

ln -sf /usr/share/pixmaps/archlinux-logo.png ~/.default-wallpaper.png

systemctl --user enable kanshi
systemctl --user enable mako
systemctl --user enable wallpaper
systemctl --user enable waybar
