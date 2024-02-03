#!/usr/bin/env zsh

typeset -A keys=(
  BackSpace   "$terminfo[kbs]"
  Home        "$terminfo[khome]"
  End         "$terminfo[kend]"
  Insert      "$terminfo[kich1]"
  Delete      "$terminfo[kdch1]"
  Up          "$terminfo[kcuu1]"
  Down        "$terminfo[kcud1]"
  Left        "$terminfo[kcub1]"
  Right       "$terminfo[kcuf1]"
  CtrlLeft    "$terminfo[kLFT5]"
  CtrlRight   "$terminfo[kRIT5]"
  AltLeft     "$terminfo[kLFT3]"
  AltRight    "$terminfo[kRIT3]"
  PageUp      "$terminfo[kpp]"
  PageDown    "$terminfo[knp]"
  ShiftTab    "$terminfo[kcbt]"
)

bindkey -e
WORDCHARS=''

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[ -n "$keys[AltLeft]"   ] && bindkey "$keys[AltLeft]"     backward-word
[ -n "$keys[AltRight]"  ] && bindkey "$keys[AltRight]"    forward-word
[ -n "$keys[CtrlLeft]"  ] && bindkey "$keys[CtrlLeft]"    vi-backward-blank-word
[ -n "$keys[CtrlRight]" ] && bindkey "$keys[CtrlRight]"   vi-forward-blank-word
[ -n "$keys[Up]"        ] && bindkey "$keys[Up]"          up-line-or-beginning-search
[ -n "$keys[Down]"      ] && bindkey "$keys[Down]"        down-line-or-beginning-search
[ -n "$keys[ShiftTab]"  ] && bindkey "$keys[ShiftTab]"    reverse-menu-complete -M menuselect

# make sure the terminal is in application mode when zle is active
# https://wiki.archlinux.org/title/zsh#Key_bindings
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
