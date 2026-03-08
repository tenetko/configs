#!/bin/bash
if [ -z "$SWAYSOCK" ]; then
  export SWAYSOCK=$(find /run/user/$(id -u)/ -name "sway-ipc.*.sock" -print -quit 2>/dev/null)
fi

[ -z "$SWAYSOCK" ] && exit 0

WP_DIR="$HOME/megasync/wallpapers"

if [ -d "$WP_DIR" ]; then
  find "$WP_DIR" -type f | shuf -n 1 | xargs -I {} swaymsg output "*" bg "{}" fill
fi
