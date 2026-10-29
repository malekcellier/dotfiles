# ~/.profile
# Environment only (safe for scripts/login). No aliases, no prompt, no echo.

# Guard (prevents re-sourcing)
if [ -n "${__PROFILE_SOURCED:-}" ]; then
  return 0
fi
__PROFILE_SOURCED=1

OS="$(uname -s)"  # Darwin / Linux

# XDG
: "${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CONFIG_HOME

# PATH helpers
path_prepend() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in *":$1:"*) ;; *) PATH="$1:$PATH" ;; esac
}

# Homebrew
if [ "$OS" = "Darwin" ] && [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ "$OS" = "Darwin" ] && [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [ "$OS" = "Linux" ] && [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# uv + user scripts
path_prepend "$HOME/.local/bin"

# cargo
path_prepend "$HOME/.cargo/bin"

# misc
[ -d /usr/local/sbin ] && PATH="$PATH:/usr/local/sbin"
export PATH

# Defaults
export EDITOR="${EDITOR:-vim}"