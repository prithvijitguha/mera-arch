#!/bin/bash
# wofi-define: dictionary lookup launcher on top of wofi's dmenu mode.
#   Type a word -> definition from ~/.config/mango/define is shown in wofi.
#
# Usage: bind this script to a key. Example for mango (config.conf):
#   bind=SUPER,d,spawn,~/.config/mango/wofi-define

DEFINE="$HOME/.config/mango/define.sh"

# Small input box, layered above everything.
word=$(wofi --dmenu --prompt "Define" --lines 0 --width 500 --height 50 \
  --define layer=overlay </dev/null)
[ -z "$word" ] && exit 0

result=$("$DEFINE" "$word" 2>&1)
