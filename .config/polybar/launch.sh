#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
HOST=$(hostname)
# Update theme colors from script
source $HOME/.config/shell/env/colors
echo Device is $HOST

polybar $HOST 2>&1 | tee -a /tmp/polybar1.log & disown

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Launch bar on all screens. See https://github.com/polybar/polybar/issues/763 for details
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar main &
#  done
#else
#  polybar main &
#fi

echo "Bars launched..."
