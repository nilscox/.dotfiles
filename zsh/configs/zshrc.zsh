#!/usr/bin/env zsh

setopt autocd

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/keybindings.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/cursor-mode.zsh"
source "$ZDOTDIR/fzf.zsh"

if [ -f "$ZDOTDIR/local.zsh" ]; then
  source "$ZDOTDIR/local.zsh"
fi

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway > /tmp/sway.out 2> /tmp/sway.err
fi
