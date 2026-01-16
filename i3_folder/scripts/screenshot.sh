#!/bin/bash
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
NAME="Screenshot_$(date +%Y%m%d_%H%M%S).png"

case "$1" in
    "full")
        maim "$DIR/$NAME"
        xclip -selection clipboard -t image/png < "$DIR/$NAME"
        notify-send "Screenshot" "Full screen captured saved to $DIR" -i "$DIR/$NAME"
        ;;
    "area")
        maim -s "$DIR/$NAME"
        xclip -selection clipboard -t image/png < "$DIR/$NAME"
        notify-send "Screenshot" "Area captured saved to $DIR" -i "$DIR/$NAME"
        ;;
esac
