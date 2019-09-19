#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  xdg-settings set default-web-browser firefox.desktop
}

run_uninstall() {
  true
}
