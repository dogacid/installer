#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting code-server installation..."
echo "------------------------------------------------"

if command_exists code-server; then
  echo "code-server is already installed."
else
  curl -fsSL https://code-server.dev/install.sh | sh
  sudo systemctl enable --now code-server@$USER
fi

echo "--- code-server setup complete. ---"
