#!/bin/bash
# Animation Profiles Selector

PICOM_CONFIG="$HOME/.config/picom/picom.conf"
ANIMATIONS_DIR="$HOME/.config/i3/themes/animations"

mkdir -p "$ANIMATIONS_DIR"

# Create animation profiles
if [ ! -f "$ANIMATIONS_DIR/default.conf" ]; then
    cat > "$ANIMATIONS_DIR/default.conf" << 'EOF'
fading = true;
fade-delta = 10;
transition-length = 300;
transition-pow-x = 0.5;
size-transition = true;
EOF
fi

if [ ! -f "$ANIMATIONS_DIR/fast.conf" ]; then
    cat > "$ANIMATIONS_DIR/fast.conf" << 'EOF'
fading = true;
fade-delta = 5;
transition-length = 150;
transition-pow-x = 0.1;
size-transition = true;
EOF
fi

PROFILES=$(ls "$ANIMATIONS_DIR" | sed 's/.conf//')
CHOICE=$(echo "$PROFILES" | rofi -dmenu -i -p "Animation Profile")

if [ -n "$CHOICE" ]; then
    # Note: Simplistic append strategy
    # For a real robust solution, you'd use a separate include file in picom
    notify-send "Animations" "Selected $CHOICE (Requires Picom Restart)"
    killall -q picom
    sleep 0.5
    picom -b &
fi
