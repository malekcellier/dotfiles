# ~/.bash_profile
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

# Ensure interactive bash sessions also get ~/.bashrc when using a login shell
if [ -n "$BASH_VERSION" ] && [[ $- == *i* ]]; then
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi