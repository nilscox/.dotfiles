#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$dest/.ssh"
chmod 700 "$dest/.ssh"

ln -sf "$dot/ssh/ssh.config" "$dest/.ssh/config"

ln -sf "$dot/ssh/ssh-agent.service" "$config/systemd/user"
sudo systemctl enable sshd
