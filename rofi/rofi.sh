#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/rofi"
ln -sf "$dot/rofi/config.rasi" "$config/rofi"
