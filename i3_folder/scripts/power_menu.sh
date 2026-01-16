#!/bin/bash
# Rofi Power Menu

options="Lock\nLogout\nReboot\nShutdown\nSuspend"

selected=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme-str 'window {width: 300px;} listview {lines: 5;}')

case "$selected" in
    "Lock")
        ~/.config/i3/scripts/lock.sh
        ;;
    "Logout")
        i3-msg exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Suspend")
        systemctl suspend
        ;;
esac
