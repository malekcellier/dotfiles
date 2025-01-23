echo "Sourcing .bash_rc, $USER!"

# this is sourced for non-login shells
if [ -f ~/.profile ]; then
    source ~/.profile
fi

eval "$(starship init bash)"
eval "$(zoxide init bash)"