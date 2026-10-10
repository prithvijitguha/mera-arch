#!/bin/bash

clients="$(mmsg get all-clients 2>/dev/null)"

text="$(
  printf '%s' "$clients" | jq -r '
    [
      .clients[]?.appid
      | select(. != null and . != "")
    ]
    | unique
    | map(
        if . == "com.mitchellh.ghostty" then "Ghostty"
        elif . == "firefox" then "Firefox"
        elif . == "steam" then "Steam"
        elif . == "com.stremio.Stremio" then "Stremio"
        elif . == "chrome-web.whatsapp.com__-Default" then "WhatsApp"
        elif . == "signal-desktop" then "Signal"
        else .
        end
      )
    | map("● " + .)
    | join("   ")
  ' 2>/dev/null
)"

if [[ -z "$text" ]]; then
  text="○"
fi

jq -cn --arg text "$text" \
  '{text: $text, tooltip: ("Running apps: " + $text)}'
