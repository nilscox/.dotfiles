#!/usr/bin/env bash

detect_distrib() {
  os_release='/etc/os-release'

  if [ ! -f "$os_release" ]; then
    echo "missing $os_release; aborting..." >&2
    exit 1
  fi

  distrib=$(cat "$os_release" | grep '^ID=' | sed 's/^ID=//')

  if [ "$distrib" == 'ubuntu' ]; then
    echo 'debian'
  elif [ "$distrib" == 'archarm' ]; then
    echo 'arch'
  else
    echo "$distrib"
  fi
}

ensure_variable() {
  if [ -z "${!1}" ]; then
    echo "warning: missing variable $1"
  fi
}

clone_or_pull() {
  if [ -d "$2" ]; then
    (cd "$2" && git pull)
  else
    git clone --depth=1 "$1" "$2"
  fi
}

root="${ROOT:-/}"
dot="${DOT:-$HOME/.dotfiles}"
dest="${DEST:-$HOME}"
config="${CONFIG:-$dest/.config}"
local="${LOCAL:-$dest/.local}"
distrib="${DISTRIB:-$(detect_distrib)}"
