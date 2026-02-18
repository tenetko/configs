#!/bin/sh

weather=$(python ~/.config/polybar/modules/openweathermap.py)
weather=$(sed "s//<span foreground='#80e8ff'><\/span>/" <<< $weather)

echo "$weather"
