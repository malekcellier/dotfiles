echo "Welcome to .profile, $USER!"

# Only for mac, provides color in sh ls
if [[ "$OSTYPE" == "darwin"* ]]; then
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
alias gl="git log"
alias gs="git status"
alias gp="git pull"
alias gf="git fetch"
alias grep="grep --color=auto"
alias nvim="neovim"
alias k="kubectl"
alias kgn="kubectl get nodes"
alias kgp="kubectl get pods"
alias gst="git status"
alias lg="lazygit"
alias bi="brew install"
alias bs="brew search"
alias y="yazi"
alias e="exit"
# locations
alias j="cd /Volumes/Journal"
alias ja="cd /Volumes/Journal_analysis"
alias repos="cd ~/Documents/repos/"
alias nas="cd ~/NAScopy/"


# Path modifications
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Homebrew
if [[ "$OSTYPE" == "darwin"* ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Defaults
export EDITOR=nvim
