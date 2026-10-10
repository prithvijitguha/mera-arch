#!/bin/bash

DEFINE="$HOME/.config/mango/define.sh"

# Small input box, layered above everything.
word=$(wofi --dmenu --prompt "Define" --lines 0 --width 500 --height 50 \
  --define layer=overlay </dev/null)
[ -z "$word" ] && exit 0

result=$("$DEFINE" "$word" 2>&1)
