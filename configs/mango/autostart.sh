#!/bin/bash

killall -9 waybar
killall mako

waybar >/dev/null 2>&1
makoctl reload
