#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting zsh-autosuggestions installation..."
echo "--------------------------------------------"

# Install git, which is required to clone the plugin
if ! command_exists git; then
  echo "Git is required for zsh-autosuggestions. Installing Git..."
  sudo apt install git -y
fi

# Directory for Zsh plugins
PLUGIN_DIR="$HOME/.zsh/plugins"
AUTOSUGGEST_PATH="$PLUGIN_DIR/zsh-autosuggestions"

if [ -d "$AUTOSUGGEST_PATH" ]; then
  echo "zsh-autosuggestions directory already exists. Skipping clone."
else
  echo "Cloning zsh-autosuggestions repository..."
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGEST_PATH"
  echo "Repository cloned."

  # Add the plugin to the shell config file (ensure it's sourced)
  echo '
# --- zsh-autosuggestions Initialization ---
source '"$AUTOSUGGEST_PATH"'/zsh-autosuggestions.zsh
' >>~/.zshrc

  echo "zsh-autosuggestions configured in ~/.zshrc."
fi
