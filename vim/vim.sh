#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

mkdir -p "$config/nvim"

ln -sf "$dot/vim/init.lua" "$config/nvim/init.lua"
ln -sf "$dot/vim/lazy-lock.json" "$config/nvim/lazy-lock.json"
ln -sf "$dot/vim/lua" "$config/nvim/lua"
