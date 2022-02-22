#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

sudo systemctl enable ntpd
