alias pkg-search='dnf search'
alias pkg-install='sudo dnf install -y'
alias pkg-upgrade='sudo dnf upgrade'

alias netdown=$'nmcli c down $(nmcli c show --active | awk \'{ if ($4 == "wlp2s0") print $1 }\')'
alias netup='netdown; nmcli c up'
