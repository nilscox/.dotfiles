#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ensure_variable PCLOUD_EMAIL

mkdir -p "$dest/.pcloud/mountpoint"
ln -s "$dest/.pcloud/mountpoint" "$dest/pcloud"

envsubst < "$dot/pcloud/pcloud.service" > "$config/systemd/user/pcloud.service"

systemctl --user enable pcloud
