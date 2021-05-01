#!/bin/env bash

source "$(dirname $0)/../functions.sh"

sudo sed -i 's/^#AutoEnable=false$/AutoEnable=true/' "$root/etc/bluetooth/main.conf"

systemctl enable bluetooth.service

sudo groupmod -aG lp $(whoami)
