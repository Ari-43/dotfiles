# Ari43's bash aliases.
# ========================================================================

# Editors
if [ -f /usr/bin/nvim ]; then alias vim='nvim'; fi
alias nv='nvim'
alias v='vim'
alias nano='nano -l' # Always use line numbers in Nano

# Pagers
alias more='less' # A classic
alias nvp='nvimpager'

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
alias kali='distrobox-enter kali'
alias aoeu='setxkbmap us'
alias asdf='setxkbmap us dvorak'

# Network and Wireless Communication
alias ping4='ping -c 4'
alias pyhttp='python3 -m http.server'
alias wificli='nmcli dev wifi'
alias lswifi='nmcli dev wifi rescan && nmcli dev wifi list'
alias bluez='bluetoothctl'

# Configuration
alias muc='muc -f $HOME/.bash_history'
alias tty-clock='tty-clock -cs -C 6'

# Fun
alias neofetch='neowofetch'
alias nf='neofetch' # Most important part of any Arch Linux install
alias pf='pfetch'
alias hf='hyfetch'
alias cnf='clear && neofetch'
alias cbonsai='cbonsai -il'
alias parrot='curl parrot.live'
alias rick='curl ascii.live/rick'
asciilive () {
	curl ascii.live/$1
}

# Misc Tools
alias yt='yt-dlp' 
