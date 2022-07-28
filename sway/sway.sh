#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/sway"

ln -sf "$dot/sway/config.sway" "$config/sway/config"
ln -sf "$dot/sway/config.d" "$config/sway"
ln -sf "$dot/sway/scripts" "$config/sway"
