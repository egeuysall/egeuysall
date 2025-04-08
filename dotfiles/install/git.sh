#!/bin/bash

RESET="\033[0m"
BLUE="\033[38;5;75m"
GREEN="\033[38;5;114m"

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
CONFIG_DIR="$DOTFILES_DIR/configs"

# Backup existing git configuration
echo -e "${BLUE}›${RESET} Backing up existing git configuration..."
[ -f "$HOME/.gitconfig" ] && cp "$HOME/.gitconfig" "$HOME/.gitconfig.backup.$(date +%Y%m%d%H%M%S)"
[ -f "$HOME/.gitignore_global" ] && cp "$HOME/.gitignore_global" "$HOME/.gitignore_global.backup.$(date +%Y%m%d%H%M%S)"

# Create symlinks for git configuration
echo -e "${BLUE}›${RESET} Setting up git configuration..."
cp "$CONFIG_DIR/git/.gitconfig" "$HOME/.gitconfig"
cp "$CONFIG_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

# Configure git user if not already configured
if ! git config --global user.name > /dev/null 2>&1; then
    read -p "$(echo -e "${BLUE}›${RESET} Enter your git display name: ")" git_name
    git config --global user.name "$git_name"
fi

if ! git config --global user.email > /dev/null 2>&1; then
    read -p "$(echo -e "${BLUE}›${RESET} Enter your git email: ")" git_email
    git config --global user.email "$git_email"
fi

# Add .gitignore_global to git config
git config --global core.excludesfile ~/.gitignore_global

# Install Git Delta if not installed for better diff visualization
if ! command -v delta &> /dev/null; then
    echo -e "${BLUE}›${RESET} Installing git-delta for better diff visualization..."
    brew install git-delta
    
    # Configure git to use delta
    git config --global core.pager "delta"
    git config --global interactive.diffFilter "delta --color-only"
    git config --global delta.navigate true
    git config --global delta.light false
    git config --global delta.line-numbers true
fi

echo -e "${GREEN}›${RESET} Git configuration complete!"
