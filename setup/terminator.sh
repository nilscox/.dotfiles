#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  mkdir -p "$CONFIG/terminator"
  mkdir -p "$CONFIG/gtk-3.0"
  ln -sf "$DOT/terminator/terminator.config" "$CONFIG/terminator/config"
  ln -sf "$DOT/gtk/gtk.css" "$CONFIG/gtk-3.0/gtk.css"
}

run_uninstall() {
  rm -rf "$CONFIG/terminator"
  # keep gtk.css as it may be use in other applications
}
