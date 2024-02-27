# Ari43's bash aliases.
# ========================================================================

# Editors
alias nv='nvim'
alias v='vim'
alias nano='nano -l' # Always use line numbers in Nano

# Pagers
alias more='less' # A classic
alias less='nvimpager'

# Files
alias untar='tar -fvxz'              
alias mkdir='mkdir -pv' # Make new directories recursively. For example, running "mkdir ./folder1/folder2/" makes ./folder1/ with folder2/ inside it without complaining. Also makes mkdir list out the directories that were made.
alias mkd='mkdir'
alias nvc='nvimpager -c'

# Shell
alias cl='clear'
alias cls='clear' # The clear screen command from Windows
alias wq='exit' # I've accidentally done this a few times
alias :wq='exit'
alias q='exit'
alias :q='exit'
alias rsh='exec $0' # This works for what I usually need it to do, which is reloading aliases or the prompt script. Stands for "restart shell".
alias sudo='sudo ' # Allows using aliases with sudo
alias icat='kitty +kitten icat'
alias ls='exa -h'
#alias ls='ls -h --color=auto'
alias l='ls'
alias ll='ls -l'
alias lls='ls -l'
alias la='ls -a'
alias lla='ls -la'

# System
alias sdn='shutdown now'
alias du='du -h'
alias nf='neofetch' # Most important part of any Arch Linux install
alias pf='pfetch'
alias ramfetch='curl -s https://codeberg.org/o69mar/ramfetch/raw/branch/main/ramfetch | sh' # I trust this repository
alias cnf='clear && neofetch && read -p ""'

# Network and Wireless Communication
alias ping4='ping -c 4'
alias pyhttp='python3 -m http.server'
alias wificli='nmcli dev wifi'
alias lswifi='nmcli dev wifi rescan && nmcli dev wifi list'
alias bluez='bluetoothctl'

# Configuration
alias muc='muc -f $HOME/.bash_history'
alias tty-clock='tty-clock -cs -C 6'
