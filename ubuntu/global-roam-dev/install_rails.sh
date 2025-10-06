#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting rails installation..."
echo "------------------------------------------------"

if command_exists rails; then
  echo "rails is already installed."
else
  echo "Installing rails"
  gem install rails
fi

echo "--- rails setup complete. ---"
