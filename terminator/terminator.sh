#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/terminator"
ln -sf "$dot/terminator/terminator.config" "$config/terminator/config"

mkdir -p "$config/gtk-3.0"
ln -sf "$dot/terminator/gtk.css" "$config/gtk-3.0/gtk.css"
