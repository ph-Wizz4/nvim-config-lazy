#!/bin/bash
# Setup script to symlink this Neovim config to ~/.config/nvim
# Usage: ./setup.sh [target_name]
#   - Default target: ~/.config/nvim
#   - Custom target: ./setup.sh my-custom-nvim → ~/.config/my-custom-nvim

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_NAME="${1:-nvim}"
TARGET_PATH="$HOME/.config/$TARGET_NAME"

echo "=== Neovim Config Setup ==="
echo ""

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "Error: Neovim is not installed."
    echo "Please install Neovim (version 0.8+) before running this script."
    exit 1
fi

NVIM_VERSION=$(nvim --version | head -n1)
echo "Found: $NVIM_VERSION"

# Check if target already exists
if [ -e "$TARGET_PATH" ]; then
    echo ""
    echo "WARNING: $TARGET_PATH already exists!"
    echo "This will OVERWRITE your current Neovim configuration."
    echo ""
    echo "Before proceeding, please backup your existing config:"
    echo "  mv $TARGET_PATH $TARGET_PATH.backup"
    echo ""
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi

    echo "Removing existing config..."
    rm -rf "$TARGET_PATH"
fi

# Create symlink
echo "Creating symlink: $TARGET_PATH → $SCRIPT_DIR"
ln -s "$SCRIPT_DIR" "$TARGET_PATH"

echo ""
echo "Setup complete!"
echo "To use this Neovim configuration, restart Neovim or run:"
echo "  nvim"
echo ""
echo "Note: This config uses lazy.nvim. Plugins will be installed on first launch."
