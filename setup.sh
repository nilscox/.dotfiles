#!/usr/bin/env bash

os_release='/etc/os-release'

if [ ! -f "$os_release" ]; then
  echo "missing $os_release; aborting..." >&2
  exit 1
fi

DETECTED_DISTRIB=$(cat "$os_release" | grep '^ID=' | sed 's/^ID=//')

if [ "$DETECTED_DISTRIB" == 'ubuntu' ]; then
  DETECTED_DISTRIB='debian'
fi

if [ "$DETECTED_DISTRIB" == 'archarm' ]; then
  DETECTED_DISTRIB='arch'
fi

[ -z "$DOT" ] && DOT=$(dirname $(readlink -f "$0"))
[ -z "$DEST" ] && DEST="$HOME"
[ -z "$CONFIG" ] && CONFIG="$DEST/.config"
[ -z "$DISTRIB" ] && DISTRIB="$DETECTED_DISTRIB"

mkdir -p "$CONFIG"
source "$DOT/setup/functions.sh"

should_setup() {
  for arg in "$@"; do
    if [ "$arg" == '--all' ]; then
      return 0;
    fi

    if [ "$arg" == "--$1" ]; then
      return 0
    fi
  done

  return 1
}

if [ "$1" != '--install' -a "$1" != '--uninstall' ]; then
  echo "usage: setup.sh [--install|--uninstall]" >&2
  exit 1
fi

units=(packages zsh git vim xorg i3 rofi fonts node terminator vscode gdrive pcloud firefox)

for u in "${units[@]}"; do
  if should_setup "$u" "$@"; then
    setup "$u" "$1" || read
  fi
done
