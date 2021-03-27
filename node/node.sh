#!/bin/env bash

source "$(dirname $0)/../functions.sh"

clone_or_pull 'git://github.com/creationix/nvm.git' "$dest/.nvm"

source "$dest/.nvm/nvm.sh"
nvm install --lts
nvm use --lts
