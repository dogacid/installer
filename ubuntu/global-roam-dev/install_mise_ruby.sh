#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting mise and ruby installation..."
echo "------------------------------------------------"

if command_exists mise; then
  echo "mise is already installed."
else
  echo "Installing mise"
  curl https://mise.run | sh
  echo 'eval "$(~/.local/bin/mise activate)"' >>~/.zshrc
  source ~/.zshrc
fi

if command_exists ruby; then
  echo "ruby is already installed."
else
  echo "Installing Ruby"
  mise use -g ruby@3
fi

echo "--- mise and ruby setup complete. ---"
