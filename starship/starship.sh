#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -sf "$dot/starship/starship.toml" "$config"
