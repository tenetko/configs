#!/bin/bash

swaylock \
  --daemonize \
  --indicator-idle-visible \
  \
  -c 000000 \
  -i "$HOME/megasync/wallpapers/hong kong dollar/https_%2F%2Fs3-ap-northeast-1.amazonaws.com%2Fpsh-ex-ftnikkei-3937bb4%2Fimages%2F9%2F0%2F0%2F3%2F653009-8-eng-GB%2F20170808_Hong-Kong.jpg" \
  --clock \
  --timestr "%H:%M:%S" \
  --datestr "%a, %B %d" \
  --inside-color 00000050 \
  --ring-color 00000000 \
  --line-color 00000000 \
  --indicator-radius 200 \
  --text-color ffffffff \
  --font Hack \
  --hide-keyboard-layout # --fade-in 0.1 \
# --grace 5 \
