echo "Sourcing .zshrc, $USER!"

if [ -f ~/.profile ]; then
    source ~/.profile
fi

# echo "Setup starship"
eval "$(starship init zsh)"
# echo "Setup zoxide"
eval "$(zoxide init zsh)"