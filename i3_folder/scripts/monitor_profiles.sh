#!/bin/bash
PROFILES_DIR="$HOME/.config/i3/monitor_profiles"
mkdir -p "$PROFILES_DIR"

if [ -z "$(ls -A "$PROFILES_DIR")" ]; then
    cat > "$PROFILES_DIR/laptop.sh" << 'EOF'
#!/bin/bash
xrandr --output eDP-1 --auto --primary
EOF
    chmod +x "$PROFILES_DIR/laptop.sh"
fi

PROFILES=$(ls "$PROFILES_DIR" | sed 's/.sh//')
CHOICE=$(echo "$PROFILES" | rofi -dmenu -i -p "Monitor Profile")

if [ -n "$CHOICE" ]; then
    bash "$PROFILES_DIR/$CHOICE.sh"
    i3-msg restart
    notify-send "Monitor" "Profile applied: $CHOICE"
fi
