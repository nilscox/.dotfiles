#!/usr/bin/env zsh

bindkey -v
export KEYTIMEOUT=1

WORDCHARS='~!#$%^&*(){}[]<>?.+;-'
[ -n "${terminfo[kLFT5]}" ] && bindkey "${terminfo[kLFT5]}" backward-word  # ctrl+left
[ -n "${terminfo[kRIT5]}" ] && bindkey "${terminfo[kRIT5]}" forward-word   # ctrl+right

zmodload zsh/complist

# use hjlk in menu selection
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # Undo

bindkey -M menuselect "${terminfo[kcbt]}" reverse-menu-complete # shift+tab

_toggle-sudo() {
  prefix="sudo "

  if [[ "$BUFFER" == "$prefix"* ]]; then
    BUFFER="${BUFFER:$#prefix}"
  else
    BUFFER="$prefix$BUFFER"
    CURSOR=$(($CURSOR + $#prefix))
  fi
}

zle -N _toggle-sudo
bindkey -M vicmd s _toggle-sudo

_toggle-sudo-history() {
  zle up-line-or-history
  _toggle-sudo
}

zle -N _toggle-sudo-history
bindkey -M vicmd S _toggle-sudo-history
