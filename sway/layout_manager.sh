#!/bin/bash

pkill -f layouts_per_window.py || true
sleep 0.2
exec /usr/bin/python3 -u ~/.config/sway/layouts_per_window.py >/tmp/switch.log 2>&1
