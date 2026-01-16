#!/bin/bash
# Refresh all i3 components

# Kill and restart polybar
if command -v polybar &>/dev/null; then
    killall -q polybar
    while pgrep -x polybar >/dev/null; do sleep 0.1; done
    ~/.config/polybar/launch.sh &
fi

# Restart picom
if command -v picom &>/dev/null; then
    killall -q picom
    sleep 0.5
    picom -b &
fi

# Reload dunst
if command -v dunst &>/dev/null; then
    killall -SIGUSR2 dunst 2>/dev/null
fi

# Reload i3
i3-msg reload

notify-send "i3" "Refreshed all components"
