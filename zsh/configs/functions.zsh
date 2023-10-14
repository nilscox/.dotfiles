#!/usr/bin/env zsh

recreate-database() {
  db=${1:-db}
  template=${2}

  psql -h localhost -U postgres postgres -c "drop database \"$db\""

  if [ -n "$template" ]; then
    psql -h localhost -U postgres postgres -c "create database \"$db\" template \"$template\""
  else
    psql -h localhost -U postgres postgres -c "create database \"$db\""
  fi
}

port2pid() {
  if [ -z "$1" ]; then
    echo "usage: port2pid <port>"
    return 1
  fi

  ss -lptnH "sport = :$1" | awk '{ print $6 }' | grep -o 'pid=[0-9]\+' | sed 's/^pid=//'
}
