#!/bin/bash
HOST=$(hostname)
. $HOME/.screenlayout/$HOST.sh
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
exec /bin/i3
