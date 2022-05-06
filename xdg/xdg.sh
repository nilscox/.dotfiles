#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -s "$dot/xdg/user-dirs.dirs" "$config"
