# echo "Welcome to .profile, $USER!"

# Define some methods
# check that a commands exists on the system
# Function to determine the OS
isOS() {
    case "$(uname -s)" in
        Darwin) [ "$1" = "macos" ] ;;
        Linux) [ "$1" = "linux" ] ;;
        *) return 1 ;; # Unsupported OS
    esac
}

# Function to check if a command exists
exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if a path exists
pathexists() {
    [ -d "$1" ] || [ -f "$1" ]
}

# Only for mac, provides color in sh ls
if isOS "macos"; then
    export CLICOLOR=1
fi

# Show the directories in light blue
export LSCOLORS=Exfxcxdxbxegedabagacad

# Define common aliases
# Commands
alias c="clear"
alias ls="ls -CF --color=auto"
alias l="ls -Ch"
alias ll="ls -ahl"

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

alias grep="grep --color=auto"
alias nvim="neovim"
alias lg="lazygit"

alias y="yazi"
alias e="exit"

# locations
if isOS "macos"; then
    if pathexists "/Volumes/Journal"; then
        alias j="cd /Volumes/Journal"
    fi
    if pathexists "/Volumes/Journal_analysis"; then
        alias ja="cd /Volumes/Journal_analysis"
    fi
    if pathexists "~/Documents/repos/"; then
        alias repos="cd ~/Documents/repos/"
    fi
    if pathexists "~/NAScopy";then
        alias nas="cd ~/NAScopy/"
    fi
fi

# alias for the path to the documents folder in the icloud
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
# icloud code folder
alias ic="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/code"


# Path modifications
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Homebrew
if isOS "macos"; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif isOS "linux"; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Defaults
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export K9S_CONFIG_DIR="$HOME/.config/k9s"

# TMUX
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins"
# make sure the configuration is read from the .config setup
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/.tmux.conf"
