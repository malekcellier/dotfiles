#!/bin/bash

# Define paths
DARK_CONFIG="$HOME/.config/tmux/tmux.theme.dark.conf"
LIGHT_CONFIG="$HOME/.config/tmux/tmux.theme.light.conf"

# Function to apply theme
apply_theme() {
    if [ "$1" == "dark" ]; then
        tmux source-file "$DARK_CONFIG"
    else
        tmux source-file "$LIGHT_CONFIG"
    fi
}

# DETECT SYSTEM THEME
# 1. MacOS Detection
if [[ "$OSTYPE" == "darwin"* ]]; then
    MODE=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    if [ "$MODE" == "Dark" ]; then
        apply_theme "dark"
    else
        apply_theme "light"
    fi

# 2. Linux Detection (Gnome/GTK)
elif command -v gsettings >/dev/null 2>&1; then
    MODE=$(gsettings get org.gnome.desktop.interface color-scheme)
    if [[ "$MODE" == *'dark'* ]]; then
        apply_theme "dark"
    else
        apply_theme "light"
    fi

# 3. Fallback (Default to Dark)
else
    apply_theme "dark"
fi