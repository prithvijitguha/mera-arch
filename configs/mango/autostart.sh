#!/bin/bash

killall -9 waybar
killall mako

makoctl reload
waybar >/dev/null 2>&1 &

~/.config/mango/change-wallpaper.sh &

if ! pgrep -x swayidle >/dev/null; then
  swayidle -w \
    timeout 300 'swaylock -f' \
    before-sleep 'swaylock -f' &
fi
