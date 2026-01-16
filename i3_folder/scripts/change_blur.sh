#!/bin/bash
PICOM_CONFIG="$HOME/.config/picom/picom.conf"
if [ ! -f "$PICOM_CONFIG" ]; then exit 1; fi

CURRENT=$(grep "blur-strength" "$PICOM_CONFIG" | grep -oP '\d+' | head -1)

if [ -z "$CURRENT" ] || [ "$CURRENT" -lt 5 ]; then
    NEW=10; MSG="Strong Blur"
else
    NEW=2; MSG="Light Blur"
fi

sed -i "s/blur-strength = .*/blur-strength = $NEW;/" "$PICOM_CONFIG"
killall -q picom; picom -b &
notify-send "Blur" "$MSG Applied"
