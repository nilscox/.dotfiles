#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  clone_or_pull 'git://github.com/creationix/nvm.git' "$DEST/.nvm"
  source "$DEST/.nvm/nvm.sh"
  nvm install --lts
  nvm use --lts
}

run_uninstall() {
  rm -rf "$DEST/.nvm"
}
