#!/bin/env bash

source "$DOT/setup/functions.sh"

fonts=(
  "http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf"
)

font_dir="$ROOT/usr/share/fonts/truetype/custom"

run_install() {
  sudo mkdir -p "$font_dir"

  for url in "${fonts[@]}"; do
    filename="${url##*/}"

    echo "* downloading font from $url"
    wget -c "$url"

    echo " * installing font $font_dir/$filename"
    sudo mv "$filename" "$font_dir"
  done

  echo "* updating font cache"
  sudo fc-cache -f -v

  tmp=$(mktemp -d)
  git clone --depth=1 'https://github.com/adobe-fonts/source-code-pro' "$tmp"
  sudo cp "$tmp/TTF/*" "$ROOT/usr/share/fonts/truetype/custom"
  rm -rf "$tmp"
}

run_uninstall() {
  echo " * removing directory $font_dir"
  sudo rm -rf "$font_dir"

  echo "* updating font cache"
  sudo fc-cache -f -v
}
