#!/bin/sh

aqius=$(python ~/.config/bar-modules/iqair.py)

if [ "$aqius" -lt 50 ]; then
  echo "<span foreground='#009966'>󰌪</span> $aqius"
elif [ "$aqius" -lt 100 ]; then
  echo "<span foreground='#ffde33'>󰌪</span> $aqius"
elif [ "$aqius" -lt 150 ]; then
  echo "<span foreground='#ff9933'>󰌪</span> $aqius"
elif [ "$aqius" -lt 200 ]; then
  echo "<span foreground='#cc0033'>󰌪</span> $aqius"
elif [ "$aqius" -lt 300 ]; then
  echo "<span foreground='#660099'>󰌪</span> $aqius"
else
  echo "<span foreground='#7e0023'>󰌪</span> $aqius"
fi
