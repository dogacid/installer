#!/bin/bash

# Function to check for LazyVim
is_lazyvim_installed() {
    # Check for the main configuration directory of a standard Neovim setup
    # AND check for a file or directory specific to LazyVim's structure.
    
    # 1. Standard config directory check (ensures *some* config exists)
    local nvim_config_dir="$HOME/.config/nvim"

    # 2. Check for the main LazyVim plugin configuration file
    # LazyVim typically creates its plugin lock file here on first run.
    local lazy_lock_file="$nvim_config_dir/lazy-lock.json"

    # 3. Check for the 'lua/plugins' directory which is standard for LazyVim structures
    local lazy_plugins_dir="$nvim_config_dir/lua/plugins"

    if [ -d "$nvim_config_dir" ] && [ -f "$lazy_lock_file" ]; then
        return 0 # 0 indicates success (true/LazyVim is likely installed)
    elif [ -d "$nvim_config_dir" ] && [ -d "$lazy_plugins_dir" ]; then
        return 0 # Secondary check for plugin directory
    else
        return 1 # 1 indicates failure (false/LazyVim is not likely installed)
    fi
}

# Example Usage in Your Script:
echo ""
echo "Checking for LazyVim installation..."
if is_lazyvim_installed; then
    echo "✅ LazyVim is detected in $HOME/.config/nvim. Skipping Neovim configuration."
else
    echo "❌ LazyVim is not detected. Proceeding with configuration (or skipping, if not needed)."
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
fi
