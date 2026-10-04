#!/bin/bash

WALLPAPER_DIR="$HOME/.local/share/backgrounds"

if [ -n "$1" ]; then
  WALLPAPER="$1"
else
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) |
    sort |
    fzf --prompt="Wallpaper > " --height=40% --border)
fi

[ -z "$WALLPAPER" ] && exit 0

pkill -x swaybg

swaybg -i "$WALLPAPER" -m fill >/dev/null 2>&1 &

matugen image "$WALLPAPER" --prefer darkness
