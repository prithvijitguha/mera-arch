#!/bin/bash

cat <<EOF >~/.local/share/applications/btop.desktop
[Desktop Entry]
Version=1.0
Name=btop
Comment=System monitor
Exec=env LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 ghostty --class=com.local.btop --title=btop -e btop
Terminal=false
Type=Application
Icon=utilities-system-monitor
Categories=System;Monitor;
StartupNotify=false
EOF
