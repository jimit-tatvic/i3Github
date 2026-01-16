#!/bin/bash
# Enhanced Wallpaper Selector with Preview

WALL_DIR="$HOME/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache/i3/wallpapers"
CURRENT="$HOME/.config/i3/wallpaper_effects/.wallpaper_current"

mkdir -p "$CACHE_DIR"
mkdir -p "$(dirname "$CURRENT")"

if [ ! -d "$WALL_DIR" ]; then
    mkdir -p "$WALL_DIR"
    notify-send "Wallpaper" "Created $WALL_DIR - Add wallpapers there!"
    exit 1
fi

# Generate thumbnails for preview
generate_preview() {
    local img="$1"
    local thumb="$CACHE_DIR/$(basename "$img").thumb.jpg"
    
    if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
        convert "$img" -resize 200x200^ -gravity center -extent 200x200 "$thumb" 2>/dev/null
    fi
    echo "$thumb"
}

# Select wallpaper with Rofi
SELECTED=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
    thumb=$(generate_preview "$img")
    echo -en "$(basename "$img")\x00icon\x1f$thumb\n"
done | rofi -dmenu -i -p "Wallpaper" -show-icons)

if [ -n "$SELECTED" ]; then
    FULL_PATH="$WALL_DIR/$SELECTED"
    
    # Apply wallpaper
    feh --bg-fill "$FULL_PATH"
    
    # Save current wallpaper
    cp "$FULL_PATH" "$CURRENT"
    
    # Update pywal colors (if installed)
    if command -v wal &>/dev/null; then
        wal -i "$FULL_PATH" -n -q
    fi
    
    # Save restore command
    echo "feh --bg-fill '$FULL_PATH'" > "$HOME/.fehbg"
    chmod +x "$HOME/.fehbg"
    
    # Refresh polybar if running
    if pgrep -x polybar >/dev/null; then
        ~/.config/polybar/launch.sh &
    fi
    
    notify-send -i "$FULL_PATH" "Wallpaper" "Applied: $SELECTED"
fi
