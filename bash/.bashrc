# ~/.bashrc
case $- in
  *i*) ;;
  *) return ;;
esac

# Shared aliases (Bash and Zsh)
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh" ]; then
    . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh"
fi

# tmux: temporary alias until we adopt the standard XDG config filename
if command -v tmux >/dev/null 2>&1 &&
   [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/.tmux.conf" ]; then
    alias tmux='tmux -f "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/.tmux.conf"'
fi

# ----- Prompt: status + user@host:path + optional (gitbranch) -----

# Returns "(branch)" if *current directory* has a .git (as you requested), else empty.
__prompt_git_branch() {
  # Handles normal repo root (.git directory) and worktree/submodule (.git file)
  [[ -d .git || -f .git ]] || return 0

  command -v git >/dev/null 2>&1 || return 0

  local b
  b="$(git symbolic-ref --quiet --short HEAD 2>/dev/null \
      || git rev-parse --short HEAD 2>/dev/null)" || return 0
  printf ' (%s)' "$b"
}

# Status marker: "." on success, "x<code>" on failure
__prompt_status_mark() {
    local st="$1"

    case "$st" in
        0) printf '●' ;;
        1) printf '○' ;;
        *) printf '○ %s' "$st" ;;
    esac
}

# Colors (optional). Comment these out if you want plain text.
__C_RESET='\[\e[0m\]'
__C_OK='\[\e[32m\]'    # green
__C_ERR='\[\e[31m\]'   # red

__prompt_command() {
  local st=$?  # exit status of last command

  local mark
  if [[ "$st" -eq 0 ]]; then
    mark="${__C_OK}$(__prompt_status_mark "$st")${__C_RESET}"
  else
    mark="${__C_ERR}$(__prompt_status_mark "$st")${__C_RESET}"
  fi

  # Build the prompt
  PS1="${mark} \u@\h:\w$(__prompt_git_branch)\$ "
}

# Don’t clobber an existing PROMPT_COMMAND; append ours.
if [[ -n "${PROMPT_COMMAND:-}" ]]; then
  PROMPT_COMMAND="__prompt_command; ${PROMPT_COMMAND}"
else
  PROMPT_COMMAND="__prompt_command"
fi