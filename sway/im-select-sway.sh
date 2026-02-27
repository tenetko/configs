#!/bin/bash

if [ -z "$1" ]; then
  swaymsg -t get_inputs | jq -r '[.[] | select(.type=="keyboard")][0].xkb_active_layout_index'
else
  swaymsg input "type:keyboard" xkb_switch_layout "$1"
fi
