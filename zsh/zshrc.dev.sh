export LOCAL_IP="$(ip a | grep 'inet .* wlp2s0' | sed -E 's,.*inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*,\1,')"
export DEBUG_PRINT_LIMIT=100000
#export NODE_OPTIONS='--max-old-space-size=4096'

alias y='yarn'
alias ytw='yarn test --watch --notify=false'
alias ya='yarn add'
alias yad='yarn add -D'
alias yar='yarn remove'
alias yui='yarn upgrade-interactive'
alias ys='yarn start'

alias g='git'
alias p='python'

alias d='docker'
alias dcp='docker-compose'

alias uuid='\uuid | tr -d "\n" C'

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

# lazy load nvm

load_nvm() {
  unset load_nvm

  unalias nvm
  unalias node
  unalias yarn
  unalias npm

  source "$HOME/.nvm/nvm.sh"
  source "$HOME/.nvm/bash_completion"

  "$@"
}

alias nvm='load_nvm nvm'
alias node='load_nvm node'
alias yarn='load_nvm yarn'
alias npm='load_nvm npm'

# change node version according to .nvmrc

load_nvmrc() {
  if [ -f .nvmrc -a -r .nvmrc ]; then
    alias nvm >/dev/null && load_nvm
    \nvm use >/dev/null
  fi
}

add-zsh-hook chpwd load_nvmrc
load_nvmrc
