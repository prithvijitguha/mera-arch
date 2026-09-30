#!/bin/bash

if wlr-randr | grep -q '^HDMI-A-1 ' &&
  wlr-randr | grep -q '^eDP-1 '; then
  wlr-randr --output eDP-1 --off
else
  wlr-randr --output eDP-1 --on
fi
