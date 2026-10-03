#!/bin/bash

killall -9 waybar
killall mako

makoctl reload
waybar >/dev/null 2>&1

swaybg -i ~/.local/share/backgrounds/1-tree-tops.webp >/dev/null 2>&1 &

swayidle -w \
  timeout 300 'swaylock -f' \
  before-sleep 'swaylock -f' &
