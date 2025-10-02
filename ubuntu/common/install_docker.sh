#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting docker installation..."
echo "------------------------------------------------"

if command_exists docker; then
  echo "Docker is already installed."
else
  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt-get update

  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  sudo docker run hello-world
fi

# Check if the current user is a member of the 'docker' group
if groups "$USER" | grep -q '\bdocker\b'; then
  echo "SUCCESS: User '$USER' is in the 'docker' group and can run Docker without sudo."
else
  echo "User '$USER' is NOT in the 'docker' group. Docker commands will likely fail, correcting..."
  sudo usermod -aG docker $USER
  newgrp docker
fi

echo "--- Docker setup complete. ---"
