#!/bin/env bash

source "$(dirname $0)/../functions.sh"

mkdir -p "$config/rofi"
ln -s "$dot/rofi/config.rasi" "$config/rofi"
