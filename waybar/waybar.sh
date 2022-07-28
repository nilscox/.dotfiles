#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/waybar"

ln -sf "$dot/waybar/config.jsonc" "$config/waybar/config"
ln -sf "$dot/waybar/styles.css" "$config/waybar/style.css"
