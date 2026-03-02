#!/bin/bash

WALLPAPER=$(find $HOME/megasync/wallpapers/ -type f | shuf -n 1)
ln -sf "$WALLPAPER" /tmp/hyprlock_lockscreen.jpg

swaymsg "input \"type:keyboard\" xkb_switch_layout 0" && hyprlock
