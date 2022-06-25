#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

sudo sed -i 's/^#AutoEnable=false$/AutoEnable=true/' "$root/etc/bluetooth/main.conf"

sudo systemctl enable bluetooth.service

sudo usermod -aG lp $(whoami)
