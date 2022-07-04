# plugins

eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# exported variables

export PATH="$HOME/.local/bin:$PATH"
export PAGER='most'
export EDITOR='vim'

# history

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

# aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir={.git,node_modules}'

alias l='ls -lh'
alias la='l -A'
alias v='vim'

alias -g G='| grep'
alias -g M='| most'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| wl-copy'
alias -g TF='| tail -f'
alias -g NUL='> /dev/null 2>&1'

alias -s pdf='firefox '
alias -s jpg='firefox '
alias -s png='firefox '
alias -s txt='cat '
alias -s md='cat '

# options

setopt correct
setopt rcexpandparam
setopt numericglobsort
setopt nobeep
setopt appendhistory
setopt histignorealldups
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# keybindings

bindkey -e

autoload -U select-word-style
select-word-style bash

bindkey_() {
  if [[ -n "$1" ]]; then
    bindkey "$1" "$2"
  fi
}

bindkey_ "${terminfo[kLFT5]}" backward-word
bindkey_ "${terminfo[kRIT5]}" forward-word

autoload -U history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey_ "${terminfo[cuu1]}" history-beginning-search-backward-end
zle -N history-beginning-search-backward-end history-search-end
bindkey_ "${terminfo[cud1]}" history-beginning-search-forward-end

# completion

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

autoload -U +X bashcompinit && bashcompinit

# custom configs

for file in ~/.zshrc.*; do
  source "$file"
done

# start sway

if [ "$TTY" = /dev/tty1 ]; then
  sway > /tmp/sway.stdout 2> /tmp/sway.stderr
fi
