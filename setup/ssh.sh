#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  ln -s "$DOT/systemd/ssh-agent.service" "$CONFIG/systemd/user"
}

run_uninstall() {
  rm -f "$CONFIG/systemd/user/ssh-agent.service"
}
