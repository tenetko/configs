#!/bin/bash
STATE_FILE="/tmp/sway_layout_group_state"

if [ -f "$STATE_FILE" ]; then
  CURRENT_PAIR=$(cat "$STATE_FILE")
else
  CURRENT_PAIR="ru"
fi

case "$CURRENT_PAIR" in
"ua") LAYOUTS="us,ua" ;;
"es") LAYOUTS="us,es" ;;
*) LAYOUTS="us,ru" ;;
esac

swaymsg "input \"type:keyboard\" xkb_layout \"$LAYOUTS\" xkb_variant \"altgr-intl,\""
