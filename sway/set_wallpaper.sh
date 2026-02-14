#!/bin/bash
WALLPAPER=$(find ~/m/wallpapers/ -type f | shuf -n 1)
swaymsg output "*" background "$WALLPAPER" fill
