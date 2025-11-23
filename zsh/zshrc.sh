#!/usr/bin/env zsh

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=100000

LS_COLORS="$(vivid generate one-dark)"
SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
NVM_DIR="$XDG_CONFIG_HOME/nvm"
PNPM_HOME="$XDG_DATA_HOME/pnpm"
PATH="$PNPM_HOME:$HOME/.local/bin:$PATH"

setopt AUTO_CD
setopt NOCLOBBER
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -U zmv

autoload -U select-word-style
select-word-style bash

bindkey -e

bindkey "^[[1;3C" forward-word      # Alt+ArrowRight
bindkey "^[[1;3D" backward-word     # Alt+ArrowLeft
bindkey "^[[1;5C" forward-word      # Ctrl+ArrowRight
bindkey "^[[1;5D" backward-word     # Ctrl+ArrowLeft
bindkey '^[[A' up-line-or-search    # ArrowUp
bindkey '^[[B' down-line-or-search  # ArrowDown

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors "$LS_COLORS"

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd tsx
zstyle ':omz:plugins:nvm' autoload yes

source "$XDG_DATA_HOME/oh-my-zsh/plugins/sudo/sudo.plugin.zsh"
source "$XDG_DATA_HOME/oh-my-zsh/plugins/nvm/nvm.plugin.zsh"

alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| wl-copy'

alias t='true'
alias g='git'
alias v='vim'
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='l -A'
alias http='http --session /tmp/http-session.json'
alias h='http'
alias py='python'
alias tmp='cd $(mktemp -d)'
alias uuid='uuidgen | tr -d "\n" | wl-copy'
alias sc='systemctl'
alias scu='systemctl --user'

alias p='pnpm'
alias pt='pnpm run test'
alias ptw='pnpm run test --watch'
alias pb='pnpm build'
alias pl='pnpm lint'
alias pd='pnpm dev'
alias ps='pnpm start'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm remove'

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt-variables

PROMPT='$prompt'
RPROMPT='$rprompt'

prompt-variables() {
  local -i exit_code="$?"
  local newline=$'\n'

  prompt="%F{blue}%3~%f $ "
  rprompt='%*'

  if [ "$exit_code" -ne 0 ]; then
    prompt="%F{red}%B[${exit_code}]%b%f ${prompt}"
  fi

  if [ -n "$vcs_info_msg_0_" ]; then
    prompt="%F{yellow} ${vcs_info_msg_0_}%f${newline}${prompt}"
  fi

  prompt="${newline}${prompt}"
}

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

# pnpm
export PNPM_HOME="/home/nils/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
