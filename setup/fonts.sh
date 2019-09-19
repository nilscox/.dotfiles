#!/bin/env bash

source "$DOT/setup/functions.sh"

fonts=(
  "http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf"
)

run_install() {
  for font in "${fonts[@]}"; do
    install_font "$font"
  done
}

run_uninstall() {
  for font in "$fonts[@]"; do
    uninstall_font "$font"
  done
}
