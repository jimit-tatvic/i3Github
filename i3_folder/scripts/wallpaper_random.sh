#!/bin/bash
WALL_DIR="$HOME/Pictures/wallpapers"
CURRENT="$HOME/.config/i3/wallpaper_effects/.wallpaper_current"

if [ ! -d "$WALL_DIR" ]; then exit 1; fi

WALLPAPERS=($(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \)))
if [ ${#WALLPAPERS[@]} -eq 0 ]; then exit 1; fi

RANDOM_WALL="${WALLPAPERS[$RANDOM % ${#WALLPAPERS[@]}]}"

feh --bg-fill "$RANDOM_WALL"
cp "$RANDOM_WALL" "$CURRENT"
if command -v wal &>/dev/null; then wal -i "$RANDOM_WALL" -n -q; fi
