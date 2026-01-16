#!/bin/bash
IDLE_TIME=600
LOCK_SCRIPT="$HOME/.config/i3/scripts/lock.sh"
xidlehook --not-when-fullscreen --not-when-audio --timer $IDLE_TIME "$LOCK_SCRIPT" '' &
