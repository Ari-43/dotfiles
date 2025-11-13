#!/bin/bash
HOST=$(hostname)
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
exec /bin/i3
