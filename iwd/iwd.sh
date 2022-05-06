#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

if [ "$distrib" = "arch" ]; then
  sudo groupadd netdev
  sudo usermod -aG netdev $(whoami)

  sudo systemctl enable iwd
  sudo systemctl start iwd
fi
