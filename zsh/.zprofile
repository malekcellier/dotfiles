echo "Sourcing .zprofile, $USER!"

# Source .profile to ensure login shells still load common settings
if [ -f ~/.profile ]; then
    source ~/.profile
fi


if [ -f ~/.zshrc ]; then
   source ~/.zshrc
fi