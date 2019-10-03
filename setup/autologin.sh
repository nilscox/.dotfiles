#!/bin/env bash

source "$DOT/setup/functions.sh"

service="[Service]
ExecStart=
ExecStart=-$(which agetty) --autologin $(whoami) --noclear %I"
file='/etc/systemd/system/getty@tty1.service.d/override.conf'

run_install() {
  sudo mkdir -p $(dirname "$file")
  echo "$service" | sudo tee "$file" >/dev/null
}

run_uninstall() {
  sudo rm -f "$file"
}
