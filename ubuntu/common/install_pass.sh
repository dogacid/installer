#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting pass installation..."
echo "------------------------------------------------"

if command_exists pass; then
  echo "pass is already installed."
else
  sudo apt update && sudo apt install pass
fi

echo "--- pass setup complete. ---"