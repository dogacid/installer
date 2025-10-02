#!/bin/bash

if command_exists lazydocker; then
  echo "Lazydocker is already installed."
else
  echo "Installing Lazydocker..."
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi
