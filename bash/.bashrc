echo "source .bashrc"

# this is sourced for non-login shells
if [ -f ~/.profile ]; then
    . ~/.profile
fi

