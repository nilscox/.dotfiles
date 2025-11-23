#!/usr/bin/env zsh

export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

export PAGER=less
export EDITOR=vim
export VISUAL=${EDITOR}

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
