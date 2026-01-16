#!/bin/bash
# Wallpaper Effects using ImageMagick

CURRENT="$HOME/.config/i3/wallpaper_effects/.wallpaper_current"
OUTPUT="$HOME/.config/i3/wallpaper_effects/.wallpaper_modified"

if [ ! -f "$CURRENT" ]; then
    notify-send "Error" "No wallpaper selected yet!"
    exit 1
fi

EFFECTS="No Effects
Black & White
Blurred
Charcoal
Edge Detect
Emboss
Oil Paint
Sepia Tone
Sharpen
Vignette"

CHOICE=$(echo "$EFFECTS" | rofi -dmenu -i -p "Wallpaper Effect")

case "$CHOICE" in
    "No Effects")
        feh --bg-fill "$CURRENT"
        notify-send "Wallpaper" "Original applied"
        ;;
    "Black & White")
        convert "$CURRENT" -colorspace gray -sigmoidal-contrast 10,40% "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Black & White applied"
        ;;
    "Blurred")
        convert "$CURRENT" -blur 0x10 "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Blur applied"
        ;;
    "Charcoal")
        convert "$CURRENT" -charcoal 0x5 "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Charcoal applied"
        ;;
    "Edge Detect")
        convert "$CURRENT" -edge 1 "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Edge Detect applied"
        ;;
    "Emboss")
        convert "$CURRENT" -emboss 0x5 "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Emboss applied"
        ;;
    "Oil Paint")
        convert "$CURRENT" -paint 4 "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Oil Paint applied"
        ;;
    "Sepia Tone")
        convert "$CURRENT" -sepia-tone 65% "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Sepia Tone applied"
        ;;
    "Sharpen")
        convert "$CURRENT" -sharpen 0x5 "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Sharpen applied"
        ;;
    "Vignette")
        convert "$CURRENT" -vignette 0x3 "$OUTPUT"
        feh --bg-fill "$OUTPUT"
        notify-send "Wallpaper" "Vignette applied"
        ;;
esac

# Update pywal if installed
if command -v wal &>/dev/null && [ -f "$OUTPUT" ]; then
    wal -i "$OUTPUT" -n -q
fi
