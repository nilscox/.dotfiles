#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

service="[Service]
ExecStart=
ExecStart=-$(which agetty) --autologin $(whoami) --noclear %I"

file="$root/etc/systemd/system/getty@tty1.service.d/override.conf"

sudo mkdir -p $(dirname "$file")
echo "$service" | sudo tee "$file" >/dev/null
