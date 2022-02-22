#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -s "$dot/imwheel/imwheel.service" "$config/systemd/user"
ln -s "$dot/imwheel/imwheelrc" "$dest/.imwheelrc"
