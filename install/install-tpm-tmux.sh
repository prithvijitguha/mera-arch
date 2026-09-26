#!/bin/bash

set -e
# Tmux plugin configuration
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  mkdir -p $HOME/.tmux/plugins/
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
