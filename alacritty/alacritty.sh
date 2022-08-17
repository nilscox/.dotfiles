#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/alacritty"
ln -s "$dot/alacritty/alacritty.yml" "$config/alacritty"
