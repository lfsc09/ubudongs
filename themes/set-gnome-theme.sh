#!/bin/bash

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$UBUDONGS_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$UBUDONGS_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$UBUDONGS_THEME_COLOR" 2>/dev/null || true

# Set default wallpaper
gsettings set org.gnome.desktop.background picture-uri $UBUDONGS_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-uri-dark $UBUDONGS_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-options 'zoom'

# Set default lockscreen
gsettings set org.gnome.desktop.screensaver picture-uri $UBUDONGS_THEME_LOCKSCREEN
gsettings set org.gnome.desktop.screensaver picture-options 'zoom'
