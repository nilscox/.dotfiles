#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  mkdir -p "$DEST/gdrive"

  mkdir -p "$CONFIG/systemd/user"
  ln -sf "$DOT/systemd/gdrive.service" "$CONFIG/systemd/user"
}

run_uninstall() {
  rmdir "$DEST/gdrive"
  rm -f "$CONFIG/systemd/user/gdrive.service"
}
