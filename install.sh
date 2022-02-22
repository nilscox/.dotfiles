#!/usr/bin/env bash

source "$(dirname $0)/functions.sh"
set -eo pipefail

install=("$@")

if [ -z "$install" ]; then
  err "usage: install.sh <unit...>"
fi

echo "root = $root"
echo "dot = $dot"
echo "dest = $dest"
echo "config = $config"
echo "local = $local"
echo "distrib = $distrib"
echo "install = ${install[@]}"
echo
echo -n "okay? "
read

set -x
mkdir -p "$config/systemd/user"
mkdir -p "$dest/.local/bin"
set +x

for unit in "${install[@]}"; do
  echo -e "\ninstall $unit\n"
  script="$dot/$unit/$unit.sh"
  "$script"
done
