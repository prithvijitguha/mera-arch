#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

if [ "$1" = "fullscreen" ]; then
  grim -l 0 "$FILE"
  notify-send "Screenshot saved" "$FILE"
elif [ "$1" = "region" ]; then
  GEOM=$(slurp) || exit 0
  if grim -l 0 -g "$GEOM" "$FILE"; then
    wl-copy <"$FILE"
    notify-send "Screenshot saved" "$FILE"
  fi
else
  exit 1
fi

wl-copy <"$FILE"
