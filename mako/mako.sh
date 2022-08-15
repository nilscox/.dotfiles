#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/mako"
ln -sf "$dot/mako/mako.config.ini" "$config/mako/config"
