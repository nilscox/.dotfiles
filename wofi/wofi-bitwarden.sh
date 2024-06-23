#!/usr/bin/env bash

session=$(systemctl --user show-environment | grep '^BW_SESSION=' | sed 's/^BW_SESSION=//')

if [ -n "$session" ]; then
  items=$(bw --session "$session" list items)
  [ "$?" -ne 0 ] && unset session
fi

if [ -z "$session" ]; then
  systemctl --user unset-environment BW_SESSION

  mpw=$(wofi --dmenu --password)
  [ -z "$mpw" ] && exit 1

  session=$(echo "$mpw" | bw unlock --raw)
  [ "$?" -ne 0 ] && exit 1

  systemctl --user set-environment BW_SESSION="$session"
  $0; exit $?
fi

names=$(echo -E "$items" | jq -r '.[].name')

item=$(echo "$names" | wofi --dmenu -i --matching=fuzzy)
[ -z "$item" ] && exit 1

password=$(echo "$items" | jq -r ".[] | select(.name == \"$item\") | .login.password")

wl-copy "$password"
