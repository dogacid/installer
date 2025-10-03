#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting fastfetch installation..."
echo "------------------------------------------------"

if command_exists fastfetch; then
  echo "Fastfetch is already installed."
else
  wget -qO fastfetch.tar.gz https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.tar.gz
  sudo tar xf fastfetch.tar.gz --strip-components=3 -C /usr/local/bin fastfetch-linux-amd64/usr/bin/fastfetch
  fastfetch --version
  rm -rf fastfetch.tar.gz
  echo "fastfetch" >>~/.zshrc
fi

echo "--- Fastfetch setup complete. ---"
