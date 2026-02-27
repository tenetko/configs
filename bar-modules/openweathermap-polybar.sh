#!/bin/sh

weather=$(python ~/.config/bar-modules/openweathermap.py)
weather=$(sed 's//%{F#80e8ff}%{F-}/' <<< $weather)

echo "$weather"
