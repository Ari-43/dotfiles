#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar left 2>&1 | tee -a /tmp/polybar1.log & disown
polybar right 2>&1 | tee -a /tmp/polybar1.log & disown
polybar last 2>&1 | tee -a /tmp/polybar1.log & disown
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
