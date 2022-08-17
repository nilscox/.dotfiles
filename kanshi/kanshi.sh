#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/kanshi"
ln -sf "$dot/kanshi/kanshi.config" "$config/kanshi/config"
