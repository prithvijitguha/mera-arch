#!/bin/bash

mkdir -p "$HOME/.local/share/applications"

cat <<EOF >"$HOME/.local/share/applications/MeraArch.desktop"
[Desktop Entry]
Version=1.0
Name=MeraArch
Comment=MeraArch Controls
Exec=ghostty --class=MeraArch --title=MeraArch -e zsh -lic '"$HOME/.local/share/mera-arch/mera-arch"'
Terminal=false
Type=Application
Icon=utilities-terminal
Categories=System;Settings;
StartupNotify=false
EOF
