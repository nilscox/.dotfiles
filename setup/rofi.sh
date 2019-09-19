#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  ln -sf "$DOT/rofi" "$CONFIG"
}

run_uninstall() {
  rm -rf "$CONFIG/rofi"
}
