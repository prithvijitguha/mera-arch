#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

if [ "$1" = "fullscreen" ]; then
  grim -l 0 "$FILE"
elif [ "$1" = "region" ]; then
  grim -l 0 -g "$(slurp)" "$FILE"
else
  exit 1
fi

wl-copy <"$FILE"

notify-send "Screenshot saved" "$FILE"
