#!/bin/bash

# Modern aesthetic color scheme
RESET="\033[0m"
BOLD="\033[1m"
BLUE="\033[38;5;75m"
GREEN="\033[38;5;114m"
YELLOW="\033[38;5;221m"
RED="\033[38;5;203m"

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR="$DOTFILES_DIR/configs"
INSTALL_DIR="$DOTFILES_DIR/install"

clear
echo -e "${BOLD}${BLUE}╭───────────────────────────────────────╮${RESET}"
echo -e "${BOLD}${BLUE}│       ${RESET}${BOLD}egeuysall's MacOS Setup${RESET}        ${BOLD}${BLUE}│${RESET}"
echo -e "${BOLD}${BLUE}╰───────────────────────────────────────╯${RESET}"
echo

# Default all modules to enabled
install_brew=true
install_shell=true
install_git=true
install_node=true
install_macos=true

echo -e "${BOLD}Select modules to install:${RESET}"
echo -e "${YELLOW}(Hit Enter to accept default [Y], or specify n/N to skip)${RESET}"

read -p "$(echo -e "${BLUE}›${RESET} Homebrew & Apps [Y/n]: ")" -r response
[[ "$response" =~ ^([nN])$ ]] && install_brew=false

read -p "$(echo -e "${BLUE}›${RESET} Shell Configuration (Zsh + Oh My Zsh) [Y/n]: ")" -r response
[[ "$response" =~ ^([nN])$ ]] && install_shell=false

read -p "$(echo -e "${BLUE}›${RESET} Git Configuration [Y/n]: ")" -r response
[[ "$response" =~ ^([nN])$ ]] && install_git=false

read -p "$(echo -e "${BLUE}›${RESET} Node.js Development Environment [Y/n]: ")" -r response
[[ "$response" =~ ^([nN])$ ]] && install_node=false

read -p "$(echo -e "${BLUE}›${RESET} macOS Preferences [Y/n]: ")" -r response
[[ "$response" =~ ^([nN])$ ]] && install_macos=false

echo
echo -e "${BOLD}Starting installation...${RESET}"
echo

# Execute selected modules
if $install_brew; then
    echo -e "${BLUE}┌ ${RESET}${BOLD}Installing Homebrew & Applications${RESET}"
    bash "$INSTALL_DIR/brew.sh"
    echo -e "${GREEN}└ Done${RESET}\n"
fi

if $install_shell; then
    echo -e "${BLUE}┌ ${RESET}${BOLD}Configuring Shell Environment${RESET}"
    bash "$INSTALL_DIR/shell.sh"
    echo -e "${GREEN}└ Done${RESET}\n"
fi

if $install_git; then
    echo -e "${BLUE}┌ ${RESET}${BOLD}Setting up Git Configuration${RESET}"
    bash "$INSTALL_DIR/git.sh"
    echo -e "${GREEN}└ Done${RESET}\n"
fi

if $install_node; then
    echo -e "${BLUE}┌ ${RESET}${BOLD}Configuring Node.js Environment${RESET}"
    bash "$INSTALL_DIR/node.sh"
    echo -e "${GREEN}└ Done${RESET}\n"
fi

if $install_macos; then
    echo -e "${BLUE}┌ ${RESET}${BOLD}Applying macOS Preferences${RESET}"
    bash "$INSTALL_DIR/macos.sh"
    echo -e "${GREEN}└ Done${RESET}\n"
fi

echo -e "${BOLD}${GREEN}╭───────────────────────────────────────╮${RESET}"
echo -e "${BOLD}${GREEN}│       ${RESET}${BOLD}Setup Complete! 🚀${RESET}             ${BOLD}${GREEN}│${RESET}"
echo -e "${BOLD}${GREEN}╰───────────────────────────────────────╯${RESET}"
echo
echo -e "${YELLOW}NOTE: ${RESET}Some changes may require a system restart to take effect."
echo
