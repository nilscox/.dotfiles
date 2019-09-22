#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  mkdir -p "$DEST/.pcloud/mountpoint"
  ln -sf "$DEST/.pcloud/mountpoint" "$DEST/pcloud"

  mkdir -p "$CONFIG/systemd/user"
  cp "$DOT/systemd/pcloud.service" "$CONFIG/systemd/user"
}

run_uninstall() {
  rmdir "$DEST/pcloud"
  rm -f "$CONFIG/systemd/user/pcloud.service"
}
