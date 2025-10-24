#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting Azure CLI installation..."
echo "------------------------------------------------"

if command_exists az; then
  echo "Azure CLI is already installed."
else
  # Install Azure CLI using Microsoft's official script
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

echo "--- Azure CLI setup complete. ---"