#!/bin/env bash

source "$DOT/setup/functions.sh"

service="[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $(whoami) --noclear %I \$TERM"
file='/etc/systemd/system/getty@tty1.service.d/override.conf'

run_install() {
  echo "$service" | sudo tee "$file"
}

run_uninstall() {
  sudo rm -f "$file"
}
