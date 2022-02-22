#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

ensure_variable GIT_USERNAME
ensure_variable GIT_EMAIL

envsubst < "$dot/git/gitconfig" > "$dest/.gitconfig"
