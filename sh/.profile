# Base shell configuration
# to bre referenced by bash and zsh

# Prevent .profile from being sourced multiple times
if [ -z "$PROFILE_ALREADY_SOURCED" ]; then
    export PROFILE_ALREADY_SOURCED=1
    echo "Sourcing .profile, $USER!"
else
echo "Ignoring .profile, $USER!"
    return
fi

OS=$(uname) # Darwin Linux
echo "OS is $OS"

# Configuration path to local .config folder
if [ -z "$XDG_CONFIG_HOME" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# K9s
export K9S_CONFIG_DIR="$HOME/.config/k9s"

# TMUX
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins"
# make sure the configuration is read from the .config setup
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/.tmux.conf"

# Homebrew
if [ "$OS" = "Darwin" ]; then
    echo "Setting up brew in Darwin"
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ "$OS" = "linux" ]; then
    echo "Setting up brew in Linux"
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Path modifications
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Define some methods
# Function to check if a command exists
exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if a path exists
pathexists() {
    [ -d "$1" ] || [ -f "$1" ]
}

# Define common aliases
# Base Commands
alias c="clear"
alias e="exit"
alias grep="grep --color=auto"
alias ls="ls -CF --color=auto"
alias l="ls -Ch"
alias ll="ls -ahl"

# 3rd party commands
if exists "git"; then
    alias gl="git log"
    alias gst="git status"
    alias gp="git pull"
    alias gf="git fetch"
fi

if exists "kubectl"; then
    alias k="kubectl"
    alias kgn="kubectl get nodes"
    alias kgp="kubectl get pods"
fi

if exists "brew"; then
    alias bi="brew install"
    alias bs="brew search"
fi

if exists "nvim"; then
    alias n="nvim"
fi

if exists "lazygit"; then
    alias lazygit="lazygit --config-files $XDG_CONFIG_HOME/lazygit/config.yml,themes/latte/blue.yml"
    alias lg="lazygit"
fi

if exists "yazi"; then
    alias y="yazi"
fi

# locations
if [ "$OS" = "Darwin" ]; then
    # Only for mac, provides color in sh ls
    export CLICOLOR=1
    # Show the directories in light blue
    export LSCOLORS=Exfxcxdxbxegedabagacad
    echo "OS is $OS, setting paths accordingly";
    if pathexists /Volumes/Journal; then
        alias j="cd /Volumes/Journal"
    fi
    if pathexists /Volumes/Journal_analysis; then
        alias ja="cd /Volumes/Journal_analysis"
    fi
    if pathexists ~/Documents/repos/; then
        alias repos="cd ~/Documents/repos/"
    fi
    if pathexists ~/NAScopy; then
        alias nas="cd ~/NAScopy/"
    fi
    export ICLOUD_DOCS=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents
    if pathexists "$ICLOUD_DOCS"; then
        alias icloud="cd $ICLOUD_DOCS"
    fi
    if pathexists "$ICLOUD_DOCS/code"; then
        alias ic="cd $ICLOUD_DOCS/code"
    fi
elif [ "$OS" = "Linux" ]; then
    echo "OS is $OS, setting paths accordingly";
else
    echo "OS is $OS, case not handled";
fi

# Defaults
export EDITOR="nvim"
