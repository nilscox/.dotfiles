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

plugins=(archlinux httpie git starship systemd sudo zsh-nvm)

source "$XDG_DATA_HOME/oh-my-zsh/oh-my-zsh.sh"

alias -g G='| grep'
alias -g GI='| grep -i'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| wl-copy'
alias -g W='--watch'

alias t='true'
alias g='git'
alias h='http --session /tmp/http-session.json'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='l -A'
alias tmp='cd $(mktemp -d)'
alias uuid='uuidgen | tr -d "\n" C'
alias k9s='k9s --readonly'

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

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway > /tmp/sway.out 2> /tmp/sway.err
fi
