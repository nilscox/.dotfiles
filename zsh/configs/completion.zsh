#!/usr/bin/env zsh

# options
setopt COMPLETE_IN_WORD
setopt LIST_ROWS_FIRST
setopt AUTO_LIST

# load modules
autoload -Uz compinit; compinit

# zstyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# completer
zstyle ':completion:*' completer _extensions _complete _approximate

# cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"

# menu
zstyle ':completion:*' menu select

# group results (by description)
zstyle ':completion:*' group-name ''

# sort by date
zstyle ':completion:*' file-sort modification follow

# directory stack
zstyle ':completion:*' complete-options true

# format
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# files colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# fallback to case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# external
[ -f /opt/google-cloud-cli/completion.zsh.inc ] && source /opt/google-cloud-cli/completion.zsh.inc
[ -f /opt/google-cloud-cli/path.zsh.inc ] && source /opt/google-cloud-cli/path.zsh.inc
