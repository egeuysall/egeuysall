# My macOS Dotfiles

A modern, minimal, yet comprehensive dotfiles setup for macOS, tailored specifically for web development.

## Features

- 🚀 One-command setup for a new macOS machine
- 🛠️ Modular approach - install only what you need
- 🧰 Web development focused tools and configurations
- 💻 Optimized terminal experience with Oh My Zsh
- 🎨 Modern, high-contrast theme for better visibility
- 🔄 Easy to update and maintain

## What's Included

- **Applications**: Installation of essential development tools via Homebrew
  - Development: Cursor, WebStorm, PyCharm, Xcode, Docker
  - Browsers: Arc, Zen
  - Productivity: Raycast, Bartender, Rectangle, Obsidian, Morgen Calendar
  - Design: Figma, Adobe Illustrator

- **Shell**: Enhanced Zsh setup with Oh My Zsh
  - Custom aliases for git, npm, pnpm, docker, and more
  - Useful functions for common development tasks
  - Modern Powerlevel10k theme with high contrast
  - Warp terminal theme (if using Warp)

- **Git**: Professional git configuration
  - Useful aliases for common git operations
  - Global gitignore for macOS, editors, and development files
  - Enhanced diff viewing with git-delta

- **Node.js**: Complete Node.js development environment
  - Latest Node.js via Homebrew
  - Global npm packages for web development
  - pnpm configuration

- **macOS**: Sensible macOS system preferences

## Installation

1. Clone this repository:
   
   git clone https://github.com/egeuysall/egeuysall.git ~/.dotfiles
   cd ~/.dotfiles

2. Make the setup script executable:
   
   chmod +x setup.sh

3. Run the setup script:
   
   ./setup.sh

4. Follow the prompts to choose which components to install.

## Customization

Feel free to fork this repository and customize it to your needs:

- Add or remove applications in install/brew.sh
- Modify shell aliases and functions in configs/shell/.aliases and configs/shell/.functions
- Adjust git configuration in configs/git/.gitconfig
- Update macOS preferences in install/macos.sh

## Updating

To update your dotfiles:

1. Pull the latest changes from your repository:
   
   cd ~/.dotfiles
   git pull

2. Run the setup script again:
   
   ./setup.sh

## Credits

This dotfiles repository is maintained by egeuysall and builds upon the excellent work of many in the open source community.

## License

GNU General Public License v3.0
