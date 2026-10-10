#!/bin/bash

WALLPAPER_DEFAULT_PATH=$HOME/.local/share/backgrounds/tree-tops.webp

WALLPAPER_PATH="${1:-$WALLPAPER_DEFAULT_PATH}"

matugen image $WALLPAPER_PATH --prefer value

swaybg -i "$WALLPAPER_PATH" >/dev/null 2>&1 &
