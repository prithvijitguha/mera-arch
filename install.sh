#!/bin/bash

set -e
# Start by installing minimal packages to start
sudo pacman -Syu $(cat ~/.local/share/mera-arch/install/mera-arch-base-packages.txt)

# Start installing other terminal tools
source ~/.local/share/mera-arch/install/install-omz.sh
source ~/.local/share/mera-arch/install/install-tpm-tmux.sh

# Then start adding the configs
cp ~/.local/share/mera-arch/configs/.bashrc ~/.bashrc
cp ~/.local/share/mera-arch/configs/.zshrc ~/.zshrc
cp ~/.local/share/mera-arch/configs/.p10k.zsh ~/.p10k.zsh
cp ~/.local/share/mera-arch/configs/.profile ~/.profile
cp ~/.local/share/mera-arch/configs/.tmux.conf ~/.tmux.conf
cp ~/.local/share/mera-arch/configs/.vimrc ~/.vimrc

cp -rT ~/.local/share/mera-arch/configs/.vim ~/.config/.vim
cp -rT ~/.local/share/mera-arch/configs/fastfetch ~/.config/fastfetch
cp -rT ~/.local/share/mera-arch/configs/ghostty ~/.config/ghostty
cp -rT ~/.local/share/mera-arch/configs/neovim ~/.config/nvim
cp -rT ~/.local/share/mera-arch/configs/wofi ~/.config/wofi
cp -rT ~/.local/share/mera-arch/configs/waybar ~/.config/waybar
cp -rT ~/.local/share/mera-arch/configs/mango ~/.config/mango
cp -rT ~/.local/share/mera-arch/configs/mako ~/.config/mako
cp -rT ~/.local/share/mera-arch/configs/swaylock ~/.config/swaylock

# Backgrounds
cp -rT ~/.local/share/mera-arch/assets/backgrounds ~/.local/share/backgrounds

# Matugen setup
mkdir -p ~/.config/matugen/templates
mkdir -p ~/.config/matugen/generated
mkdir -p ~/.config/ghostty/themes

cp -rT ~/.local/share/mera-arch/configs/matugen/config.toml ~/.config/matugen/config.toml
cp -rT ~/.local/share/mera-arch/configs/matugen/templates ~/.config/matugen/templates

# rmpc setup
mkdir -p ~/.config/rmpc
mkdir -p ~/Music/rmpc-cache

cp -rT ~/.local/share/mera-arch/configs/rmpc/config.ron ~/.config/rmpc/config.ron
cp -rT ~/.local/share/mera-arch/configs/matugen/templates ~/.config/matugen/templates

# Setup the mera-arch scripts
cp -rT ~/.local/share/mera-arch/bin/mera-arch ~/.local/share/mera-arch

# Screen share settings for xdg portal
cp -rT ~/.local/share/mera-arch/configs/xdg-desktop-portal-wlr/config ~/.config/xdg-desktop-portal-wlr/config

# Change default shell to zsh
chsh -s $(which zsh)

exec zsh
