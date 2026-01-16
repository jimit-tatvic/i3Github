#!/bin/bash
# Quick Rofi menu for common toggles

OPTIONS="Wifi Menu\nBluetooth Menu\nAudio Mixer\nDisplay Settings"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Settings")

case "$CHOICE" in
    "Wifi Menu")
        nm-connection-editor &
        ;;
    "Bluetooth Menu")
        blueman-manager &
        ;;
    "Audio Mixer")
        pavucontrol &
        ;;
    "Display Settings")
        arandr &
        ;;
esac
