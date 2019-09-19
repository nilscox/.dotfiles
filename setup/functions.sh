#!/usr/bin/env sh

clone_or_pull() {
  if [ -d "$2" ]; then
    (cd "$2" && git pull)
  else
    git clone --depth=1 "$1" "$2"
  fi
}

install_font() {
  url="$1"
  filename="${url##*/}"
  font_dir="/usr/share/fonts/truetype/custom"

  sudo mkdir -p "$font_dir"

  echo "* downloading font from $url"
  wget -c "$url"

  echo " * installing font $font_dir/$filename"
  sudo mv "$filename" "$font_dir"

  echo "* updating font cache"
  sudo fc-cache -f -v
}

uninstall_font() {
  url="$1"
  filename="${url##*/}"
  font_dir="/usr/share/fonts/truetype/custom"

  echo "* uninstalling font $font_dir/$filename"

  sudo rm -f "$font_dir/$filename"

  echo "* updating font cache"
  sudo fc-cache -f -v
}

install_package() {
  if [ "$DISTRIB" = "debian" ]; then
    sudo apt install "$@"
  elif [ "$DISTRIB" = "arch" ]; then
    sudo pacman -S "$@"
  else
    echo "unknown distribution $DISTRIB; cannot install packages"
    return 1
  fi
}

setup() {
  if [ "$#" -ne 2 ]; then
    echo "usage: setup unit [--install|--uninstall]" >&2
    return 1
  fi

  path="$DOT/setup/$1.sh"

  if [ ! -f "$path" ]; then
    echo "error: cannot stat $path" >&2
    return 1
  fi

  source "$path"

  case "$2" in
    "--install")
      echo "* installing $1"
      run_install
      ;;
    "--uninstall")
      echo "* uninstalling $1"
      run_uninstall
      ;;
    *)
      echo "unkown argument: $2" >&2
      return 1
  esac

  if [ "$?" -eq "0" ]; then
    echo "* installed $1 sucessfully"
  else
    echo "* $1 install failed"
    return 1
  fi
}
