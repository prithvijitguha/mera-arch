#!/bin/bash

killall -9 waybar
killall mako

waybar >/dev/null 2>&1
makoctl reload

swaybg -i ~/.local/share/backgrounds/1-tree-tops.webp >/dev/null 2>&1 &
