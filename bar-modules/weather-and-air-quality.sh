#!/bin/sh

weather=$($HOME/.config/bar-modules/openweathermap-waybar.sh)
iqair=$($HOME/.config/bar-modules/iqair-waybar.sh)

echo "$weather $iqair"
