alias apts='apt-cache search --names-only'
alias apti='sudo apt-get install'
alias aptu='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove'
alias aptr='sudo apt-get remove'

alias netdown=$'nmcli c down $(nmcli c show --active | awk \'{ if ($4 == "wlp2s0") print $1 }\')'
alias netup='netdown; nmcli c up'
