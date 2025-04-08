# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme to powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set plugins
plugins=(
  git
  node
  npm
  docker
  macos
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-z
  web-search
  copypath
  copyfile
  vscode
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Set default path
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Set language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set default editor
export EDITOR='code'

# Load aliases and functions
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.functions ] && source ~/.functions

# Node.js version management with pnpm
export PNPM_HOME="$HOME/Library/pnpm"
[ -d "$PNPM_HOME" ] && export PATH="$PNPM_HOME:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add Cursor to path if it exists
[ -d "/Applications/Cursor.app/Contents/MacOS" ] && export PATH="$PATH:/Applications/Cursor.app/Contents/MacOS"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Directory navigation
setopt AUTO_CD

# Welcome message
echo "👋 Welcome back, egeuysall! Happy coding! 💻"
