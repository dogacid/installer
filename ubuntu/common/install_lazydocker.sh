#!/bin/bash

if command_exists lazydocker; then
  echo "Lazydocker is already installed."
else
  echo "Installing Lazydocker..."
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi

if grep -q 'alias ldk="lazydocker"' ~/.zshrc; then
  echo "ldk alias already exists"
else
  echo "Adding ldk alias for lazydocker to .zshrc file"
  echo 'alias ldk="lazydocker"' >>~/.zshrc
fi
