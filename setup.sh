#!/usr/bin/env bash

units=(
  packages
  autologin
  zsh
  ssh
  git
  vim
  xorg
  i3
  wallpaper
  rofi
  fonts
  node
  terminator
  vscode
  gdrive
  pcloud
  firefox
)

action="$1"
shift
args="$*"

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
[ -z "$ROOT" ] && ROOT="/"
[ -z "$CONFIG" ] && CONFIG="$DEST/.config"
[ -z "$DISTRIB" ] && DISTRIB="$DETECTED_DISTRIB"

mkdir -p "$CONFIG"
source "$DOT/setup/functions.sh"

should_setup() {
  result=1

  for arg in $(echo "$args" | cat); do
    if [ "$arg" == '--all' -o "$arg" == "$1" ]; then
      result=0
    fi

    if [ "$arg" == "-$1" ]; then
      return 1
    fi
  done

  return "$result"
}

if [ "$action" != 'install' -a "$action" != 'uninstall' -a "$action" != 'reinstall' ]; then
  echo "usage: setup.sh <action> [unit...|--all]" >&2
  echo "action: install | uninstall | reinstall" >&2
  echo "units: ${units[@]}" >&2
  exit 1
fi

mkdir -p "$DEST/.local/bin"
mkdir -p "$CONFIG/systemd/user"

for u in "${units[@]}"; do
  if should_setup "$u"; then
    setup "$u" "$action" || read
  fi
done
