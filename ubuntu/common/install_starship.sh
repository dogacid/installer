#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting Starship installation..."
echo "---------------------------------"

if command_exists starship; then
  echo "Starship is already installed. Skipping."
else
  echo "Installing Starship..."
  # Install the latest release using the recommended script
  curl -sS https://starship.rs/install.sh | sh -s -- -y

  # Add the initialization to the shell config file
  echo '
# --- Starship Prompt Initialization ---
# Ensure Zsh is used, though it should be set as default shell
if [[ -n "$ZSH_VERSION" ]]; then
  eval "$(starship init zsh)"
fi
' >>~/.zshrc

  echo "Starship installed and configuration added to ~/.zshrc."
fi
