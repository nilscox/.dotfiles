#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -s "$dot/wallpaper/set-wallpaper.sh" "$dest/.local/bin/wallpaper.sh"
