#!/bin/bash

RESET="\033[0m"
BLUE="\033[38;5;75m"
GREEN="\033[38;5;114m"
YELLOW="\033[38;5;221m"
RED="\033[38;5;203m"

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo -e "${BLUE}›${RESET} Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configure Homebrew path based on architecture
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo -e "${BLUE}›${RESET} Updating Homebrew..."
    brew update
fi

# Install essential CLI tools
echo -e "${BLUE}›${RESET} Installing CLI tools..."
brew install git
brew install bash
brew install node
brew install pnpm
brew install docker
brew install gh  # GitHub CLI
brew install wget
brew install ripgrep
brew install fd
brew install jq

# Install GUI applications with Homebrew Cask
echo -e "${BLUE}›${RESET} Installing your development tools..."
brew install --cask cursor
brew install --cask webstorm
brew install --cask pycharm
brew install --cask warp

# Browsers
echo -e "${BLUE}›${RESET} Installing browsers..."
brew install --cask arc
brew install --cask orion  # Closest match to "zen browser"

# Productivity tools
echo -e "${BLUE}›${RESET} Installing productivity tools..."
brew install --cask raycast
brew install --cask bartender
brew install --cask rectangle
brew install --cask obsidian
brew install --cask morgen  # Morgen calendar

# Design tools
echo -e "${BLUE}›${RESET} Installing design tools..."
brew install --cask figma

# Install App Store applications using mas
echo -e "${BLUE}›${RESET} Installing App Store CLI..."
brew install mas

# Install Xcode from App Store
mas_xcode_id="497799835"  # Xcode app ID
if ! mas list | grep -q "$mas_xcode_id"; then
    echo -e "${BLUE}›${RESET} Installing Xcode from App Store..."
    mas install "$mas_xcode_id" || echo -e "${YELLOW}› Please install Xcode manually from the App Store${RESET}"
else
    echo -e "${BLUE}›${RESET} Xcode is already installed"
fi

# Install Adobe Creative Cloud
echo -e "${BLUE}›${RESET} Installing Adobe Creative Cloud..."
brew install --cask adobe-creative-cloud
echo -e "${YELLOW}› Please open Adobe Creative Cloud app to install Illustrator${RESET}"

# Clean up
echo -e "${BLUE}›${RESET} Cleaning up..."
brew cleanup

echo -e "${GREEN}›${RESET} All applications have been installed or queued for installation!"
