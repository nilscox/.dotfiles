#!/usr/bin/env zsh

source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"

export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
