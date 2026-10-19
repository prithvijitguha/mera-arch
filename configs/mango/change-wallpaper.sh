#!/bin/bash

STATE_FILE="${XDG_STATE_HOME:-$HOME/.local/state}/mango-wallpaper"
FALLBACK="$HOME/.local/share/backgrounds/tree-tops.webp"

mkdir -p "$(dirname "$STATE_FILE")"

if [ -n "$1" ]; then
  WALLPAPER_PATH="$1"
  printf '%s\n' "$WALLPAPER_PATH" >"$STATE_FILE"
elif [ -s "$STATE_FILE" ]; then
  WALLPAPER_PATH="$(cat "$STATE_FILE")"
else
  WALLPAPER_PATH="$FALLBACK"
fi

matugen image "$WALLPAPER_PATH" --prefer value

# Stop any existing wallpaper daemon so they don't stack up
pkill -x swaybg 2>/dev/null

# Detach fully so it survives the menu/terminal closing
setsid -f swaybg -i "$WALLPAPER_PATH" >/dev/null 2>&1

magick $WALLPAPER_PATH \
  -blur 0x12 \
  -fill black \
  -colorize 30 \
  ~/.local/share/backgrounds/lockscreen.webp
