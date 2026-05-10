#!/bin/bash

# Define paths
DOTFILES_DIR=$(pwd)

# Create symlinks
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

# Clone plugins if they don't exist
PLUGIN_DIR="$HOME/.zsh/plugins"
mkdir -p "$PLUGIN_DIR"

if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGIN_DIR/zsh-autosuggestions"
fi

if [ ! -d "$PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$PLUGIN_DIR/zsh-syntax-highlighting"
fi

# Create the Neovim config directory if it doesn't exist
mkdir -p "$HOME/.config/nvim"

# Symlink the init.lua from your repo to the system config path
ln -sf "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# Optional: Install ripgrep if on Ubuntu/Debian (needed for Telescope)
if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y ripgrep
fi

echo "✅ Dotfiles linked and plugins installed!"
