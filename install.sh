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

# Backgrounds
cp -rT ~/.local/share/mera-arch/assets/backgrounds ~/.local/share/backgrounds
# Change default shell to zsh
chsh -s $(which zsh)
