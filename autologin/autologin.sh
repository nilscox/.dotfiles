#!/bin/env bash

source "$(dirname $0)/../functions.sh"

service="[Service]
ExecStart=
ExecStart=-$(which agetty) --autologin $(whoami) --noclear %I"

file="$root/etc/systemd/system/getty@tty1.service.d/override.conf"

sudo mkdir -p $(dirname "$file")
echo "$service" | sudo tee "$file" >/dev/null
