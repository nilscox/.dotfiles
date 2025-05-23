#/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SESSION_TYPE="wayland"
export XDG_CURRENT_DESKTOP="sway"

export NVM_DIR="$XDG_DATA_HOME/nvm"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export LS_COLORS="$(vivid generate one-dark)"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export NVM_COMPLETION="true"
export NVM_LAZY_LOAD="true"
export NVM_AUTO_USE="true"

# CASE_SENSITIVE="true"   # case sensitive completion
HYPHEN_INSENSITIVE="true" # hyphen-insensitive completion
ENABLE_CORRECTION="true"  # enable command auto-correction
HISTFILE="$ZDOTDIR/.zsh_history"
DISABLE_MAGIC_FUNCTIONS=true

plugins=(archlinux httpie git starship systemd sudo zsh-nvm)

source "$XDG_DATA_HOME/oh-my-zsh/oh-my-zsh.sh"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

source <(fzf --zsh)

alias -g G='| grep'
alias -g GI='| grep -i'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| wl-copy'
alias -g W='--watch'

alias t='true'
alias g='git'
alias v='vim'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='l -A'
alias h='http --session /tmp/http-session.json'
alias py='python'
alias tmp='cd $(mktemp -d)'
alias uuid='uuidgen | tr -d "\n" C'
alias k9s='k9s --readonly'
alias serve='pnpx serve -s -l 8080'

alias p='pnpm'
alias pt='pnpm run test'
alias ptw='pnpm run test --watch'
alias pb='pnpm build'
alias ptc='pnpm tsc --noEmit'
alias pl='pnpm lint'
alias pd='pnpm dev'
alias ps='pnpm start'
alias psw='pnpm start --watch'
alias pup='pnpm up -iL'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm remove'
alias psb='pnpm storybook'

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

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway > /tmp/sway.out 2> /tmp/sway.err
fi
