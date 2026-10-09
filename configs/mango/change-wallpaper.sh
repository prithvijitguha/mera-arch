#!/bin/bash

WALLPAPER_PATH="${1:-$HOME/.local/share/backgrounds/1-tree-tops.webp}"

swaybg -i "$WALLPAPER_PATH" >/dev/null 2>&1 &
