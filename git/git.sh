#!/bin/env bash

source "$(dirname $0)/../functions.sh"

ensure_variable GIT_USERNAME
ensure_variable GIT_EMAIL

envsubst < "$dot/git/gitconfig" > "$dest/.gitconfig"
