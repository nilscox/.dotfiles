#!/bin/env bash

source "$(dirname $0)/../functions.sh"

ln -s "$dot/imwheel/imwheel.service" "$config/systemd/user"
