#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting Node.js and gemini-cli installation..."
echo "------------------------------------------------"

# --- A. Install Node.js and npm via NodeSource (for up-to-date packages) ---

if command_exists node; then
  echo "Node.js is already installed. Skipping."
else
  echo "Installing Node.js via NodeSource repository..."

  # 1. Install necessary dependencies for adding repositories
  if ! command_exists curl; then
    echo "Installing curl..."
    sudo apt install curl -y
  fi

  # 2. Add the NodeSource repository for the latest LTS version (e.g., Node 20 or 22)
  # Using Node 20 as it's the current LTS choice for many Rails projects.
  # Note: This script adds the source; subsequent 'apt install' uses it.
  curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

  # 3. Install Node.js (which includes npm)
  echo "Installing nodejs (which includes npm)..."
  sudo apt install nodejs -y
  echo "Node.js and npm installed successfully."
fi
