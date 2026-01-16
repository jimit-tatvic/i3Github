#!/bin/bash
# Toggle Compositor for gaming

if pgrep -x picom >/dev/null; then
    killall picom
    notify-send "Game Mode" "Compositor Disabled (Max Performance)"
else
    picom -b
    notify-send "Game Mode" "Compositor Enabled"
fi
