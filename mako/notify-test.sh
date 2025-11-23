title="${title:-Hello world!}"
body="${body:-This is an example notification.}"

notify() {
  systemctl --user restart mako && notify-send "$title" "$body"
}
