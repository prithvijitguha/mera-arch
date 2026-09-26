#!/bin/bash

set -e

# Register GNOME custom shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
  "[
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/'
]"

# Set Wofi to Super+Space
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "@as []"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'wofi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'sh -c wofi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
