#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting tailscale installation..."
echo "------------------------------------------------"

if command_exists tailscale; then
  echo "Tailscale is already installed."
else
  curl -fsSL https://tailscale.com/install.sh | sh
  sudo tailscale up
fi

echo "--- Tailscale setup complete. ---"
