#!/bin/bash

STATE="$HOME/.config/mango/idle-disabled"

if [[ -f "$STATE" ]]; then
  # Deactivated: automatic idle lock is disabled
  printf '{"text":"󰛨","alt":"deactivated"}\n'
else
  # Activated: automatic idle lock is enabled
  printf '{"text":"󰛩","alt":"activated"}\n'
fi
