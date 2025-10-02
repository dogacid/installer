#!/bin/bash

source ~/.installer/ubuntu/common/helper.sh

echo ""
echo "Starting Latest Neovim (v0.11.x) installation..."
echo "------------------------------------------------"

# Target minimum version for comparison (without 'v')
TARGET_VERSION="0.11.0"

if command_exists nvim; then
  echo "Neovim is already installed. Checking version..."

  # 1. Get the version string (e.g., "v0.9.5")
  RAW_VERSION=$(nvim --version | head -n 1 | awk '{print $2}')
  echo "Found Neovim version: $RAW_VERSION"

  # 2. **CRITICAL FIX:** Strip the leading 'v' from the version string for dpkg comparison
  INSTALLED_VERSION="${RAW_VERSION#v}"

  echo "Comparing version '$INSTALLED_VERSION' against minimum required '$TARGET_VERSION'..."

  # Use dpkg for proper version comparison: $V1 ge $V2 (greater than or equal to)
  if dpkg --compare-versions "$INSTALLED_VERSION" "ge" "$TARGET_VERSION"; then
    echo "Installed version $INSTALLED_VERSION is recent enough (>= $TARGET_VERSION). Skipping."
    echo "--- Neovim setup complete. ---"
    # Use an exit code or clear break/return here to stop processing this section
    INSTALLED_VERSION="latest" # Set a flag to ensure the installation block is skipped
  else
    echo "Installed version $INSTALLED_VERSION is too old. Proceeding with update/installation."
  fi
else
  # If nvim is not installed, we proceed directly to installation
  INSTALLED_VERSION="0.0.0"
fi

# The installation logic proceeds only if INSTALLED_VERSION is old or nvim was not installed (lt TARGET_VERSION)
if [ "$INSTALLED_VERSION" != "latest" ] && dpkg --compare-versions "$INSTALLED_VERSION" "lt" "$TARGET_VERSION"; then
  echo "Installing Neovim via official **Nightly PPA** to ensure the latest version..."

  # 1. Install software-properties-common for add-apt-repository
  if ! command_exists add-apt-repository; then
    echo "Installing software-properties-common..."
    sudo apt install software-properties-common -y
  fi

  # 2. Remove the old stable PPA if it exists (prevents conflicts)
  echo "Removing any existing Neovim PPA..."
  sudo add-apt-repository --remove ppa:neovim-ppa/stable -y 2>/dev/null

  # 3. Add the Neovim Nightly PPA
  echo "Adding Neovim Nightly PPA ('unstable')..."
  sudo add-apt-repository ppa:neovim-ppa/unstable -y

  # 4. Update package lists
  sudo apt update -y

  # 5. Install Neovim
  echo "Installing Neovim..."
  sudo apt install neovim -y
  echo "Neovim (nvim) installed successfully via the Nightly PPA."
fi

if [ "$INSTALLED_VERSION" != "latest" ]; then
  echo "--- Neovim setup complete. ---"
fi
