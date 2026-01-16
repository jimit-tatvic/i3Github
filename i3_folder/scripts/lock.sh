#!/bin/bash
# Checks for i3lock-color or falls back to i3lock

if command -v i3lock-color &>/dev/null; then
    i3lock-color --blur 5 --clock --indicator --ring-color=89b4fa --keyhl-color=a6e3a1
else
    i3lock -c 1e1e2e
fi
