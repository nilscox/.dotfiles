#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  echo "installing systemd..."
  sudo systemctl start cronie.service
  sudo systemctl enable cronie.service
}

run_uninstall() {
  echo "uninstalling systemd..."
  sudo systemctl stop cronie.service
  sudo systemctl disable cronie.service
}
