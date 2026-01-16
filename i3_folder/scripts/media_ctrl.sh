#!/bin/bash
case "$1" in
    play-pause) playerctl play-pause ;;
    next) playerctl next ;;
    prev) playerctl previous ;;
esac
