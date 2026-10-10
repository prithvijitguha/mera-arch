#!/bin/bash

BROWSER="firefox"
ENGINE="https://google.com/?q="

urlencode() {
  python3 -c 'import sys, urllib.parse as u; print(u.quote_plus(sys.argv[1]))' "$1"
}

# No input list: wofi returns whatever you typed when you press Enter.
input=$(wofi --dmenu --prompt "Search" --lines 0 --width 500 --height 50 --define layer=overlay </dev/null)
[ -z "$input" ] && exit 0

case "$input" in
g\ *)
  exec "$BROWSER" "${ENGINE}$(urlencode "${input#g }")"
  ;;
http://* | https://*)
  exec "$BROWSER" "$input"
  ;;
*)
  exec "$BROWSER" "${ENGINE}$(urlencode "$input")"
  ;;
esac
