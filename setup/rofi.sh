#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  mkdir -p "$CONFIG/rofi"
  ln -sf "$DOT/rofi/config.rasi" "$CONFIG/rofi"
}

run_uninstall() {
  rm -rf "$CONFIG/rofi"
}
