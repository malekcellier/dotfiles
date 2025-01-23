echo "Sourcing .bash_profile, $USER!"

# Source .profie to ensure login shells still load common settings
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# Source .bashrc for interactive configurations
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi