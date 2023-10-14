#!/usr/bin/env zsh

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_MINUS
setopt INC_APPEND_HISTORY   # Append line to history when entered rather than when shell exits
