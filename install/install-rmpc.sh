#!/bin/bash

cat <<EOF >~/.local/share/applications/rmpc.desktop
[Desktop Entry]
Version=1.0
Name=rmpc
Comment=Music player (MPD client)
Exec=env LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 ghostty --class=com.local.rmpc --title=rmpc -e rmpc
Terminal=false
Type=Application
Icon=audio-x-generic
Categories=Audio;Player;
StartupNotify=false
EOF
