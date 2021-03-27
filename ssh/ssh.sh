#!/bin/env bash

source "$(dirname $0)/../functions.sh"

mkdir -p "$dest/.ssh"
chmod 700 "$dest/.ssh"

ln -s "$dot/ssh/ssh-agent.service" "$config/systemd/user"
