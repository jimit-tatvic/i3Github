#!/bin/bash
# Simple LoFi Radio Player
OPTIONS="Lofi Girl\nChillhop\nSmooth Jazz\nStop All"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Radio")

case "$CHOICE" in
    "Lofi Girl")
        pkill mpv
        mpv --no-video "https://www.youtube.com/watch?v=jfKfPfyJRdk" &
        notify-send "Radio" "Playing Lofi Girl"
        ;;
    "Stop All")
        pkill mpv
        ;;
esac
