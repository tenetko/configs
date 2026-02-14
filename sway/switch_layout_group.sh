#!/bin/bash

STATE_FILE="/tmp/sway_layout_group_state"

if [ -f "$STATE_FILE" ]; then
  CURRENT_PAIR=$(cat "$STATE_FILE")
else
  CURRENT_PAIR="ru"
fi

case "$CURRENT_PAIR" in
"ru")
  NEW_PAIR="ua"
  LAYOUTS="us,ua"
  NOTIFY_TEXT="🇺🇸 US / 🇺🇦 UA"
  ;;
"ua")
  NEW_PAIR="es"
  LAYOUTS="us,es"
  NOTIFY_TEXT="🇺🇸 US / 🇪🇸 ES"
  ;;
"es")
  NEW_PAIR="ru"
  LAYOUTS="us,ru"
  NOTIFY_TEXT="🇺🇸 US / 🇷🇺 RU"
  ;;
*)
  # Fallback reset
  NEW_PAIR="ru"
  LAYOUTS="us,ru"
  NOTIFY_TEXT="🇺🇸 US / 🇷🇺 RU"
  ;;
esac

swaymsg "input \"type:keyboard\" xkb_layout \"${LAYOUTS}\""
echo "$NEW_PAIR" >"$STATE_FILE"
notify-send -t 1000 -h string:x-canonical-private-synchronous:layout_switch "Layout Group" "$NOTIFY_TEXT"
