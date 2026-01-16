#!/bin/bash
# Uses pamixer or pactl
case "$1" in
    up)
        pamixer -i 5 || pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    down)
        pamixer -d 5 || pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    mute)
        pamixer -t || pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
esac

# Send notification
VOL=$(pamixer --get-volume || pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
notify-send -r 1001 -h int:value:"$VOL" "Volume" "Level: $VOL%"
