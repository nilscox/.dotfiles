#!/bin/env bash

source "$(dirname $0)/../functions.sh"

mkdir -p "$config/terminator"
ln -s "$dot/terminator/terminator.config" "$config/terminator/config"

mkdir -p "$config/gtk-3.0"
ln -s "$dot/terminator/gtk.css" "$config/gtk-3.0/gtk.css"
