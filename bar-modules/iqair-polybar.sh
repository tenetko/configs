#!/bin/sh

aqius=$(python ~/.config/bar-modules/iqair.py)

if [ "$aqius" -lt 50 ]; then
  echo "%{F#009966}󰌪%{F-} $aqius"
elif [ "$aqius" -lt 100 ]; then
  echo "%{F#ffde33}󰌪%{F-} $aqius"
elif [ "$aqius" -lt 150 ]; then
  echo "%{F#ff9933}󰌪%{F-} $aqius"
elif [ "$aqius" -lt 200 ]; then
  echo "%{F#cc0033}󰌪%{F-} $aqius"
elif [ "$aqius" -lt 300 ]; then
  echo "%{F#660099}󰌪%{F-} $aqius"
else
  echo "%{F#7e0023}󰌪%{F-} $aqius"
fi
