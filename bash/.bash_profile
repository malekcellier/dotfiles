echo "Welcome to .bash_profile, $USER!"

# Source .profie to ensure login shells still load common settings
if [ -f ~/.profile ]; then
    . ~/.profile
fi
