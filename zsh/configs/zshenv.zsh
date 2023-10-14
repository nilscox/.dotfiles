#!/usr/bin/env zsh

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER='most'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SESSION_TYPE="wayland"
export XDG_CURRENT_DESKTOP="sway"

export NVM_DIR="$XDG_DATA_HOME/nvm"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

export PATH="$PNPM_HOME:$PATH"
export PATH="$PATH:$HOME/.local/bin"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GTK_THEME="Adwaita:dark"
export LS_COLORS="$(vivid generate one-dark)"
