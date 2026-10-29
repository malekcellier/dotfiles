# ~/.zshrc
# Zsh interactive configuration

# Shared aliases (Bash and Zsh)
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh" ]; then
    . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh"
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# Zoxide navigation
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi