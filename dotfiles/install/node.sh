#!/bin/bash

RESET="\033[0m"
BLUE="\033[38;5;75m"
GREEN="\033[38;5;114m"

# Ensure Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${BLUE}›${RESET} Installing Node.js..."
    brew install node
fi

echo -e "${BLUE}›${RESET} Node.js $(node --version) is installed"
echo -e "${BLUE}›${RESET} npm $(npm --version) is installed"

# Install pnpm if not already installed
if ! command -v pnpm &> /dev/null; then
    echo -e "${BLUE}›${RESET} Installing pnpm..."
    npm install -g pnpm
fi

echo -e "${BLUE}›${RESET} pnpm $(pnpm --version) is installed"

# Install global npm packages for web development
echo -e "${BLUE}›${RESET} Installing global development tools..."
npm install -g npm@latest
npm install -g typescript
npm install -g eslint
npm install -g prettier
npm install -g http-server
npm install -g serve
npm install -g json-server

# Create pnpm directory if it doesn't exist
mkdir -p "$HOME/Library/pnpm"

echo -e "${GREEN}›${RESET} Node.js development environment setup complete!"
