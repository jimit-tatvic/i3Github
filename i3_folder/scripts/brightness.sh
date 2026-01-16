#!/bin/bash
case "$1" in
    up)
        brightnessctl s +5%
        ;;
    down)
        brightnessctl s 5%-
        ;;
esac

VAL=$(brightnessctl g)
MAX=$(brightnessctl m)
PERCENT=$((VAL * 100 / MAX))
notify-send -r 1002 -h int:value:"$PERCENT" "Brightness" "Level: $PERCENT%"
