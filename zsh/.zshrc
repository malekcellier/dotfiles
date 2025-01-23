echo "Sourcing .zshrc, $USER!"

if [ -f ~/.profile ]; then
    source ~/.profile
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"