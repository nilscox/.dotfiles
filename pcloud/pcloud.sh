#!/bin/env bash

source "$(dirname $0)/../functions.sh"

ensure_variable PCLOUD_EMAIL

mkdir -p "$dest/.pcloud/mountpoint"
ln -s "$dest/.pcloud/mountpoint" "$dest/pcloud"

envsubst < "$dot/pcloud/pcloud.service" > "$config/systemd/user/pcloud.service"

systemctl --user enable pcloud
