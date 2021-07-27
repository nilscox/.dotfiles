#!/bin/bash

file="$XDG_RUNTIME_DIR/polybar.env"

top=1
bottom=1
setup=laptop

is_bar() {
  if [ "$1" != 'top' -a "$1" != 'bottom' ]; then
    echo "exepected 'top' | 'bottom', got '$1'" >&2
    return 1
  fi
}

is_setup() {
  if [ "$1" != 'work' -a "$1" != 'mirror' -a "$1" != 'laptop' -a "$1" != 'oa' ]; then
    echo "exepected 'work' | 'mirror' | 'laptop' | 'oa', got '$1'" >&2
    return 1
  fi
}

is_bool() {
  if [ "$1" != '0' -a "$1" != '1' ]; then
    echo "exepected '0' | '1', got '$1'" >&2
    return 1
  fi
}

load() {
  source "$file"

  top="${BAR_TOP:-top}"
  bottom="${BAR_BOTTOM:-bottom}"
  setup="${SETUP:-$setup}"
}

dump() {
  echo "BAR_TOP=$top" > "$file"
  echo "BAR_BOTTOM=$bottom" >> "$file"
  echo "SETUP=$setup" >> "$file"
}

[ ! -f "$file" ] && dump
load

case "$1" in
  "");;
  --toggle)
    is_bar "$2" || exit 1
    declare "$2"=$((1 - "${!2}"))
    shift 2;;
  --set)
    is_bar "$2" || exit 1
    is_bool "$3" || exit 1
    declare "$2"="$3"
    shift 3;;
  --setup)
    is_setup "$2" || exit 1
    setup="$2"
    shift 2;;
  *)
    echo "expected '--toggle' | '--set', got '$1'" >&2
    exit 1;;
esac

dump
systemctl --user restart polybar
