#!/bin/bash
LAYOUTS="us\nus intl\ngb\nde\nfr\nes"
CURRENT=$(setxkbmap -query | grep layout | awk '{print $2}')
CHOICE=$(echo -e "$LAYOUTS" | rofi -dmenu -i -p "Keyboard Layout" -select "$CURRENT")

if [ -n "$CHOICE" ]; then
    setxkbmap "$CHOICE"
    notify-send "Keyboard" "Layout: $CHOICE"
fi
