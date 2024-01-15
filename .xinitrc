#!/bin/bash
. $HOME/.screenlayout/primary.sh
conky &
killall redshift &
#redshift &
xbindkeys 
xbacklight
picom -b
/usr/lib/kdeconnectd &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/xfce-polkit/xfce-polkit &
blueman-applet &
streamdeck -n &
setxkbmap -layout us,us -variant 'dvorak, '
$HOME/.local/bin/mowbatcheck &
# GTK Fixes
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
xrdb ~/.Xresources
exec /bin/i3
