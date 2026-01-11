echo "Sourcing .bash_rc, $USER!"

#export PS1="\u@\h:\w$ "
#export PS1="\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\]<\u@\h \W>\$ "

# this is sourced for non-login shells
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# eval "$(starship init bash)"
eval "$(zoxide init bash)"
