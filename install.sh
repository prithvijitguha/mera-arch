
#!/bin/bash

set -e
# Start by installing minimal packages to start 
sudo pacman -Syu $(cat ~/.local/share/mera-arch/install/mera-arch-base-packages.txt)

# Start installing other terminal tools 
source ~/.local/share/mera-arch/install/omz.sh

# Then start adding the configs
cp ~/.local/share/mera-arch/configs/.bashrc ~/.bashrc
cp ~/.local/share/mera-arch/configs/.zshrc ~/.zshrc
cp ~/.local/share/mera-arch/configs/.p10k.zsh ~/.p10k.zsh
cp ~/.local/share/mera-arch/configs/.profile ~/.profile
cp ~/.local/share/mera-arch/configs/.tmux.conf ~/.tmux.conf
cp ~/.local/share/mera-arch/configs/.vimrc ~/.vimrc

cp -r ~/.local/share/mera-arch/configs/.vim ~/.config/.vim
cp -r ~/.local/share/mera-arch/configs/fastfetch ~/.config/fastfetch
cp -r ~/.local/share/mera-arch/configs/ghostty ~/.config/ghostty
cp -r ~/.local/share/mera-arch/configs/hunk ~/.config/hunk
cp -r ~/.local/share/mera-arch/configs/neovim ~/.config/nvim
cp -r ~/.local/share/mera-arch/configs/wofi ~/.config/wofi
