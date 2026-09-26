#!/bin/bash

set -e

ascii_art='
███╗   ███╗███████╗██████╗  █████╗       █████╗ ██████╗  ██████╗██╗  ██╗
████╗ ████║██╔════╝██╔══██╗██╔══██╗     ██╔══██╗██╔══██╗██╔════╝██║  ██║
██╔████╔██║█████╗  ██████╔╝███████║     ███████║██████╔╝██║     ███████║
██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██║     ██╔══██║██╔══██╗██║     ██╔══██║
██║ ╚═╝ ██║███████╗██║  ██║██║  ██║     ██║  ██║██║  ██║╚██████╗██║  ██║
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
'

# Define the color gradient (shades of cyan and blue)
colors=(
  '\033[38;5;81m' # Cyan
  '\033[38;5;75m' # Light Blue
  '\033[38;5;69m' # Sky Blue
  '\033[38;5;63m' # Dodger Blue
  '\033[38;5;57m' # Deep Sky Blue
  '\033[38;5;51m' # Cornflower Blue
  '\033[38;5;45m' # Royal Blue
)
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art" || true

echo ""
echo ""
# Split the ASCII art into lines
# Print each line with the corresponding color
for i in "${!lines[@]}"; do
  color_index=$((i % ${#colors[@]}))
  echo -e "${colors[color_index]}${lines[i]}\033[0m"
done
echo -e "\nBegin installation (or abort with ctrl+c)..."

echo "Cloning Mera-arch..."
if [[ -d ~/.local/share/mera-arch/.git ]]; then
  cd ~/.local/share/mera-arch
  git fetch origin
  git pull --ff-only
else
  git clone https://github.com/prithvijitguha/mera-arch.git ~/.local/share/mera-arch
  source ~/.local/share/mera-arch/install.sh
fi

if [[ -n "${MERAARCH_REF:-}" && "$MERAARCH_REF" != "main" ]]; then
  echo "Using mera-arch branch: $MERAARCH_REF"
  git checkout "$MERAARCH_REF"
fi

echo "Installation starting..."
source ~/.local/share/mera-arch/install.sh
