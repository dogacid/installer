#!/bin/bash

# Update package lists
sudo apt update -y

# Install things common to many of the packages
sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev git unzip

# --- Step 1: Install Zsh and Set as Default Shell ---
source ../common/install_zsh.sh

# --- Step 2: Install Starship Prompt (Advanced shell prompt) ---
source ../common/install_starship.sh

# --- Step 3: Install zsh-autosuggestions ---
source ../common/install_zsh-autosuggestions.sh

# --- Step 4: Install Latest Neovim (v0.11.x) via Nightly PPA ---
source ../common/install_neovim.sh

# --- Step 4.1 LazyVIM ---
source ../common/install_lazy_vim.sh

# --- Step 5: Install Node.js, npm, and gemini-cli ---
source ../common/install_nodejs.sh

# --- Step 6: Tailscale ---
source ../common/install_tailscale.sh

# --- Step 7 Install gemini-cli ---
source ../common/install_gemini.sh

# --- Step 8 INstall Docker ---
source ../common/install_docker.sh

# --- Step 9 mise and ruby ---
source ./install_mise_ruby.sh

# --- Final Steps ---

echo ""
echo "--- Initial Shell Setup Complete ---"
echo "You must **log out and log back in** for Zsh, Starship, and zsh-autosuggestions to take effect."
