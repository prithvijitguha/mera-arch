#!/bin/bash

STATE="$HOME/.config/mango/idle-disabled"

if [[ -f "$STATE" ]]; then
  rm "$STATE"
  swayidle -w timeout 300 'swaylock -f' before-sleep 'swaylock -f' &
  notify-send "Idle Inhibitor disabled" "Screen locks after 5 minutes"
else
  touch "$STATE"
  pkill -x swayidle
  notify-send "Idle Inhibitor enabled" "Automatic screen locking paused"
fi
