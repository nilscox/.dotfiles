find_nvmrc() {
  dir="$1"

  while [ "$dir" != "/" ]; do
    if [ -f "$dir/.nvmrc" ]; then
      echo "$dir/.nvmrc"
      return
    fi

    dir=$(dirname "$dir")
  done
}

loaded=false

chpwd() {
  nvmrc=$(find_nvmrc "$PWD")

  if [ "$nvmrc" = "" ]; then
    if [ "$loaded" = "true" ]; then
      nvm use default
      loaded=false
    fi
  elif [ $(cat "$nvmrc") != $(node -v | grep -o '[0-9]\+' | head -1) ]; then
    nvm use
    loaded=true
  fi
}
