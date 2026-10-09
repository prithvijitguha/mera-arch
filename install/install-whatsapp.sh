#!/bin/bash

mkdir -p ~/.local/share/applications/icons

cp assets/icons/whatsapp.png $HOME/.local/share/applications/icons/whatsapp.png

cat <<EOF >~/.local/share/applications/WhatsApp.desktop
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=chromium --app="https://web.whatsapp.com" --name=WhatsApp --class=Whatsapp
Terminal=false
Type=Application
Icon=$HOME/.local/share/applications/icons/whatsapp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
StartupWMClass=chrome-web.whatsapp.com__-Default
EOF
