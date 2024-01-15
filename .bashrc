#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start an X session if on TTY1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

export EDITOR='/usr/bin/nvim'
export VISUAL=$EDITOR 
export PAGER='/bin/nvimpager -p'
export MANPAGER=$PAGER

export PATH=$PATH:"$HOME/.local/bin"

HISTSIZE=-1
HISTFILESIZE=-1

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# This prompt may be a bit messy since I made it manually. 
# TODO
# Add right justification options 
# Change the color of the '@' based on the distro
if [ "$color_prompt" = yes ]; then
	# Old: #export PS1='\[\e[32m\]\[\e[42m\]\[\e[30m\] \t \[\e[46m\]\[\e[32m\]\[\e[30m\] \u\[\e[31m\] @ \[\e[30m\]\H \[\e[00m\]\[\e[43m\]\[\e[36m\]\[\e[30m\] \w \[\e[00m\]\[\e[41m\]\[\e[33m\]\[\e[97m\] \$ \[\e[00m\]\[\e[31m\]\[\e[00m\] '
	export PS1='\[$(tput setaf 27)\]\[$(tput setaf 15)$(tput setab 27)\] \t \[$(tput setaf 27)$(tput setab 39)\]\[$(tput setaf 15)\] \u \[$(tput setaf 39)$(tput setab 45)\]\[$(tput setaf 15)\] \w \[\e[00m$(tput setaf 45)\]\[\e[00m\] '
else
	PS1='[\u@\h \W]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# show a welcome screen if the welcome script exists
if [ -x $HOME/.local/bin/welcome ]
then
    $HOME/.local/bin/welcome
fi
