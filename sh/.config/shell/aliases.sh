# ~/.config/shell/aliases.sh
# Shared interactive aliases for Bash and Zsh.
# Compatible with macOS and Linux.

# General
alias c='clear'
alias e='exit'
alias ll='ls -ahl'
alias l='ls -Ch'

# Platform-specific commands
case "$(uname -s)" in
    Darwin)
        alias ls='ls -CF -G'
        export CLICOLOR=1
        export LSCOLORS=Exfxcxdxbxegedabagacad
        ;;
    Linux)
        alias ls='ls -CF --color=auto'
        alias grep='grep --color=auto'
        ;;
esac

# Git
if command -v git >/dev/null 2>&1; then
    alias gl='git log'
    alias gst='git status'
    alias gp='git pull'
    alias gf='git fetch'
fi

# Homebrew
if command -v brew >/dev/null 2>&1; then
    alias bi='brew install'
    alias bs='brew search'
fi

# Editors and utilities
command -v nvim >/dev/null 2>&1 && alias n='nvim'
command -v yazi >/dev/null 2>&1 && alias y='yazi'
command -v lazygit >/dev/null 2>&1 && alias lg='lazygit'
