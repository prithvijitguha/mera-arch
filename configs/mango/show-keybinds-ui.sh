#!/bin/bash

SCRIPT="$HOME/.config/mango/show-keybinds.sh"

exec ghostty \
  --class=mango-keybinds \
  --title="Mango Hotkeys" \
  --window-width=110 \
  --window-height=45 \
  -e "$SCRIPT"
