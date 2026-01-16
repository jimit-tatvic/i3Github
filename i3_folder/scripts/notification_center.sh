#!/bin/bash

# Check current DND status
IS_PAUSED=$(dunstctl is-paused)

if [ "$IS_PAUSED" == "true" ]; then
  TOGGLE="🔕 Enable Notifications"
  STATUS="Status: 🔴 DND Active"
else
  TOGGLE="🔔 Enable DND Mode"
  STATUS="Status: 🟢 Notifications On"
fi

# Options for Rofi
OPTIONS="$STATUS\n$TOGGLE\n📜 Show Context/Last\n🗑️ Clear All History"

# Show menu
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Notifications" -theme-str 'window {width: 300px; height: 250px;}')

case "$CHOICE" in
*"Enable"*)
  dunstctl set-paused toggle
  notify-send "Notification Mode" "Changed DND Status"
  ;;
*"Show Context"*)
  # Pops the last notification from history or context menu
  dunstctl history-pop
  ;;
*"Clear All"*)
  dunstctl close-all
  dunstctl history-clear
  notify-send "History" "Notification history cleared"
  ;;
esac
