PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
PATH="$PATH:$HOME/.krew/bin"
PATH="$PATH:$HOME/go/bin"

export ANDROID_SDK_ROOT=/opt/android-sdk
export CLOUDSDK_PYTHON=/usr/bin/python
LOCAL_IP="$(ip a | grep 'inet .* wlp2s0' | sed -E 's,.*inet ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*,\1,')"

source "$HOME/.nvm/nvm.sh"
source "$HOME/.nvm/bash_completion"
source "$HOME/.local/scripts/nvm-auto-use.sh"

[ -f /opt/google-cloud-sdk/completion.zsh.inc ] && source /opt/google-cloud-sdk/completion.zsh.inc
[ -f /opt/google-cloud-sdk/path.zsh.inc ] && source /opt/google-cloud-sdk/path.zsh.inc

export NODE_ENV=development
export TS_NODE_TRANSPILE_ONLY=true
export DEBUG_PRINT_LIMIT=100000

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && source ~/.config/tabtab/zsh/__tabtab.zsh

alias y='yarn'
alias yt='yarn test'
alias ytw='yarn test --watch'
alias yb='yarn build'
alias ytc='yarn tsc --noEmit'
alias yl='yarn lint'
alias yd='yarn dev'
alias ys='yarn start'
alias ysw='yarn start --watch'
alias yui='yarn upgrade-interactive'
alias ya='yarn add'
alias yad='yarn add -D'
alias yar='yarn remove'
alias ysb='yarn storybook'

alias p='pnpm'
alias pt='pnpm run test'
alias ptw='pnpm run test --watch'
alias pb='pnpm build'
alias ptc='pnpm tsc --noEmit'
alias pl='pnpm lint'
alias pd='pnpm dev'
alias ps='pnpm start'
alias psw='pnpm start --watch'
alias pui='pnpm upgrade-interactive'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm remove'
alias psb='pnpm storybook'

alias g='git'
alias py='python'

alias d='docker'
alias dcp='docker-compose'

alias uuid='\uuid | tr -d "\n" C'

alias k9s='\k9s --readonly'

alias -g W='--watch'

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
