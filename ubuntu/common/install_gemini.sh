#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting gemini-cli installation..."
echo "------------------------------------------------"

if command_exists gemini; then
  echo "gemini-cli is already installed."
else
  sudo npm install -g @google/gemini-cli
fi

echo "--- gemini-cli setup complete. ---"
