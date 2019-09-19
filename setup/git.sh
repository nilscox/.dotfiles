#!/bin/env bash

source "$DOT/setup/functions.sh"

run_install() {
  ln -sf "$DOT/git/gitconfig" "$DEST/.gitconfig"
  ln -sf "$DOT/git/gitignore_global" "$DEST/.gitignore_global"
}

run_uninstall() {
  rm -f "$DEST/.gitconfig"
  rm -f "$DEST/.gitignore_global"
}


