#!/usr/bin/env sh

clone_or_pull() {
  if [ -d "$2" ]; then
    (cd "$2" && git pull)
  else
    git clone --depth=1 "$1" "$2"
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
    "install")
      echo "* installing $1"
      run_install
      ;;
    "uninstall")
      echo "* uninstalling $1"
      run_uninstall
      ;;
    "reinstall")
      echo "* reinstalling $1"
      run_uninstall
      run_install
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
