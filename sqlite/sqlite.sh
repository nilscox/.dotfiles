#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ln -sf "$dot/sqlite/sqliterc" "$dest/.sqliterc"
