export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export DEBUG_PRINT_LIMIT=100000
export TS_NODE_TRANSPILE_ONLY=true
#export NODE_OPTIONS='--max-old-space-size=8192'

LOCAL_IP="$(ip a | grep 'inet .* wlp2s0' | sed -E 's,.*inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*,\1,')"

NVM_COMPLETION="true"
NVM_LAZY_LOAD="false"
NVM_AUTO_USE="true"

alias y='yarn'
alias yt='yarn test'
alias ytw='yarn test --watch --notify=false'
alias yb='yarn build'
alias yl='yarn lint'
alias ys='yarn start'
alias yui='yarn upgrade-interactive'
alias ya='yarn add'
alias yad='yarn add -D'
alias yar='yarn remove'

alias g='git'
alias p='python'

alias d='docker'
alias dcp='docker-compose'

alias uuid='\uuid | tr -d "\n" C'

alias -g W='--watch'

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