#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo "Starting Zsh installation and configuration..."
echo "----------------------------------------------"

# 2. Install Zsh
if ! command_exists zsh; then
  echo "Installing Zsh..."
  sudo apt install zsh -y
else
  echo "Zsh is already installed. Skipping."
fi

# 3. Change the default shell for the current user (if needed)
CURRENT_USER=$(whoami)
if [ "$SHELL" != "/usr/bin/zsh" ] && [ "$SHELL" != "/bin/zsh" ]; then
  echo "Changing default shell for user '$CURRENT_USER' to Zsh."
  # NOTE: This uses sudo and relies on your initial sudo credentials to bypass a password prompt here.
  sudo chsh -s /usr/bin/zsh "$CURRENT_USER"
  echo "Default shell set to Zsh."
else
  echo "Default shell is already set to Zsh. Skipping."
fi
