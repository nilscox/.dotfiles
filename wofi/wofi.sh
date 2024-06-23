#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -sf "$dot/wofi/wofi-bitwarden.sh" "$local/bin"
