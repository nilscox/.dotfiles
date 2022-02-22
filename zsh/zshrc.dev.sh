# variables

PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
PATH="$PATH:$HOME/.krew/bin"
PATH="$PATH:/opt/android-sdk/cmdline-tools/latest/bin"
PATH="$PATH:/opt/android-sdk/tools"
PATH="$PATH:/opt/android-sdk/platform-tools"

export ANDROID_SDK_ROOT=/opt/android-sdk
export CLOUDSDK_PYTHON=/usr/bin/python3.7
export DEBUG_PRINT_LIMIT=100000
export TS_NODE_TRANSPILE_ONLY=true
export NODE_ENV=development
#export NODE_OPTIONS='--max-old-space-size=8192'

LOCAL_IP="$(ip a | grep 'inet .* wlp2s0' | sed -E 's,.*inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*,\1,')"

# node

# todo auto load nvm

alias y='yarn'
alias yt='yarn test'
alias ytw='yarn test --watch --notify=false'
alias yb='yarn build'
alias ytc='yarn tsc --noEmit'
alias yl='yarn lint'
alias ys='yarn start'
alias ysw='yarn start --watch'
alias yui='yarn upgrade-interactive'
alias yuil='yarn upgrade-interactive --latest'
alias ya='yarn add'
alias yad='yarn add -D'
alias yar='yarn remove'

alias g='git'
alias p='python'

alias d='docker'
alias dcp='docker-compose'

alias uuid='\uuid | tr -d "\n" C'

alias k9s='\k9s --readonly'

alias -g W='--watch'

# utils

recreate-database() {
  db=${1:-db}
  template=${2}

  psql -h localhost -U root postgres -c "drop database \"$db\""

  if [ -n "$template" ]; then
    psql -h localhost -U root postgres -c "create database \"$db\" template \"$template\""
  else
    psql -h localhost -U root postgres -c "create database \"$db\""
  fi
}

frame() {
  l="$1"
  s="${2:-10}"

  if [ -z "$l" ]; then
    echo "usage: frame <line> [<size> = 10]" >&2
    return 1
  fi

  head -n "$((l + s))" | tail -n "$((2 * s + 1))"
}

port2pid() {
  if [ -z "$1" ]; then
    echo "usage: port2pid <port>"
    return 1
  fi

  ss -lptnH "sport = :$1" | awk '{ print $6 }' | grep -o 'pid=[0-9]\+' | sed 's/^pid=//'
}
