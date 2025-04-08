#!/bin/bash

RESET="\033[0m"
BLUE="\033[38;5;75m"
GREEN="\033[38;5;114m"

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
CONFIG_DIR="$DOTFILES_DIR/configs"

# Create necessary directories
mkdir -p "$HOME/.config"

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${BLUE}›${RESET} Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${BLUE}›${RESET} Oh My Zsh already installed"
fi

# Install Powerlevel10k theme
echo -e "${BLUE}›${RESET} Installing Powerlevel10k theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install custom plugins
echo -e "${BLUE}›${RESET} Installing Zsh plugins..."

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh-z for quick navigation
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z" ]; then
    git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z
fi

# Backup existing configs
echo -e "${BLUE}›${RESET} Backing up existing configuration files..."
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d%H%M%S)"

# Apply new configurations
echo -e "${BLUE}›${RESET} Setting up shell configurations..."
cp "$CONFIG_DIR/shell/.zshrc" "$HOME/.zshrc"
cp "$CONFIG_DIR/shell/.p10k.zsh" "$HOME/.p10k.zsh"
cp "$CONFIG_DIR/shell/.aliases" "$HOME/.aliases"
cp "$CONFIG_DIR/shell/.functions" "$HOME/.functions"

# Configure Warp terminal if installed
if [ -d "$HOME/Library/Application Support/warp" ]; then
    echo -e "${BLUE}›${RESET} Setting up Warp terminal configuration..."
    mkdir -p "$HOME/Library/Application Support/warp/themes"
    cp "$CONFIG_DIR/shell/warp_theme.yaml" "$HOME/Library/Application Support/warp/themes/egeuysall_theme.yaml"
    echo -e "${GREEN}›${RESET} Warp theme installed. You can select it in the Warp preferences."
fi

echo -e "${GREEN}›${RESET} Shell configuration complete! Restart your terminal or source ~/.zshrc to apply changes."
