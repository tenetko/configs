#!/bin/bash

PIDFILE="/tmp/awww_script.pid"

if [ -f "$PIDFILE" ]; then
  OLD_PID=$(cat "$PIDFILE")
  kill "$OLD_PID" 2>/dev/null || true
fi

echo $$ >"$PIDFILE"

pkill awww-daemon || true
/usr/local/bin/awww-daemon &
sleep 1

WP_DIR="$HOME/megasync/wallpapers"

while true; do
  NEXT_WALL=$(find "$WP_DIR" -type f | shuf -n 1)
  /usr/local/bin/awww img "$NEXT_WALL" --transition-type fade --transition-duration 2
  sleep 600
done
