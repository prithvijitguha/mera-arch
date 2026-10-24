#!/bin/bash

cat <<EOF >~/.local/share/applications/Jellyfin.desktop
[Desktop Entry]
Version=1.0
Name=Jellyfin
Comment=Jellyfin Media
Exec=chromium --app="http://127.0.0.1:8096" --name=Jellyfin --class=Jellyfin
Terminal=false
Type=Application
Icon=$HOME/.local/share/applications/icons/jellyfin.png
Categories=AudioVideo;Video;Player;
MimeType=text/html;text/xml;application/xhtml+xml;
StartupNotify=true
StartupWMClass=Jellyfin
EOF
