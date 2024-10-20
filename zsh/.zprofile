echo "Welcome to .zprofile, $USER!"

# Source .profile to ensure login shells still load common settings
if [ -f ~/.profile ]; then
    . ~/.profile
fi
