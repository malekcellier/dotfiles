# ~/.profile
# Shared login environment for Bash and Zsh on macOS and Linux.
# POSIX-compatible. No aliases, prompts, or terminal output.

# Prevent repeated initialization in the same shell
if [ "${__PROFILE_SOURCED:-0}" = 1 ]; then
    return 0
fi
__PROFILE_SOURCED=1

# XDG Base Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Homebrew
_brew=

case "$(uname -s)" in
    Darwin)
        if [ -x /opt/homebrew/bin/brew ]; then
            _brew=/opt/homebrew/bin/brew
        elif [ -x /usr/local/bin/brew ]; then
            _brew=/usr/local/bin/brew
        fi
        ;;
    Linux)
        if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
            _brew=/home/linuxbrew/.linuxbrew/bin/brew
        fi
        ;;
esac

if [ -n "$_brew" ]; then
    eval "$("$_brew" shellenv sh)"
fi
unset _brew

# PATH helpers (avoid duplicates and nonexistent directories)
path_prepend() {
    [ -d "$1" ] || return 0
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

path_append() {
    [ -d "$1" ] || return 0
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}

path_prepend "$HOME/.local/bin"
# path_prepend "$HOME/.cargo/bin"
path_append /usr/local/sbin

# Obsidian CLI (macOS only)
if [ "$(uname -s)" = "Darwin" ]; then
    path_append "/Applications/Obsidian.app/Contents/MacOS"
fi

export PATH

# Remove temporary helper functions
unset -f path_prepend path_append

# Preferred editor, with portable fallback
if [ -z "${EDITOR:-}" ]; then
    if command -v nvim >/dev/null 2>&1; then
        EDITOR=nvim
    elif command -v vim >/dev/null 2>&1; then
        EDITOR=vim
    else
        EDITOR=vi
    fi
fi

export EDITOR
export VISUAL="${VISUAL:-$EDITOR}"
