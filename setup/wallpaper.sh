#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  ln -sf "$DOT/wallpaper/wallpaper.sh" "$DEST/.local/bin"
}

run_uninstall() {
  rm -r "$DEST/.local/bin/wallpaper.sh"
}
