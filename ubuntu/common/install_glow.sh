#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting glow installation..."
echo "------------------------------------------------"

if command_exists glow; then
  echo "glow is already installed."
else
  # Ubuntu (Snapcraft)
  sudo snap install glow
fi

echo "--- glow setup complete. ---"
