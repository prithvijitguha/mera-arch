#!/bin/bash

set -e

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# POWERLEVEL10K
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/.git" ]; then
  git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi
