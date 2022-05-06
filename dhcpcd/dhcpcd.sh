#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

if [ "$distrib" = "arch" ]; then
  sudo systemctl enable dhcpcd
  sudo systemctl start dhcpcd
fi
