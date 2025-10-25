#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting pass installation..."
echo "------------------------------------------------"

if command_exists pass; then
  echo "pass is already installed."
else
  sudo apt update && sudo apt install pass gnupg2
  gpg --full-generate-key
  KEY_ID=$(gpg --list-secret-keys --keyid-format=long | grep '^sec' | tail -1 | awk '{print $2}' | cut -d'/' -f2)
  pass init $KEY_ID
  wget https://github.com/docker/docker-credential-helpers/releases/download/v0.6.4/docker-credential-pass-v0.6.4-amd64.tar.gz
  tar xvzf docker-credential-pass-v0.6.4-amd64.tar.gz
  sudo mv docker-credential-pass /usr/local/bin/
  chmod +x /usr/local/bin/docker-credential-pass
fi

echo "--- pass setup complete. ---"
