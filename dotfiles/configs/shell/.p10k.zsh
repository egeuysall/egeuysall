# Generated by Powerlevel10k configuration wizard. Custom configuration for egeuysall.
# Type `p10k configure` to generate a new config.

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob
  
  # High-contrast, modern theme for egeuysall
  
  # The basic colors
  local grey='242'
  local red='203'
  local yellow='221'
  local blue='39'
  local magenta='170'
  local cyan='44'
  local white='255'
  
  # Left prompt segments
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir                     # Current directory
    vcs                     # Git status
    node_version            # Node.js version
    command_execution_time  # Last command execution time
    status                  # Exit code of the last command
  )
  
  # Right prompt segments
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    background_jobs         # Background jobs
    direnv                  # direnv status
    virtualenv              # Python virtual environment
    context                 # User@host
    time                    # Current time
  )
  
  # Basic prompt styling
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
  
  # Prompt symbol
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=""
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u276F%F{cyan}\u276F%F{green}\u276F%f "
  
  # Directory styling
  typeset -g POWERLEVEL9K_DIR_BACKGROUND="$blue"
  typeset -g POWERLEVEL9K_DIR_FOREGROUND="$white"
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
  
  # Git styling
  typeset -g POWERLEVEL9K_VCS_BACKGROUND="$magenta"
  typeset -g POWERLEVEL9K_VCS_FOREGROUND="$white"
  
  # Status styling
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND="$red"
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND="$white"
  
  # Time styling
  typeset -g POWERLEVEL9K_TIME_BACKGROUND="$grey"
  typeset -g POWERLEVEL9K_TIME_FOREGROUND="$white"
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
  
  # Node.js version
  typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND="$green"
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND="$white"
  
  # Command execution time
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$yellow"
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$black"
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
