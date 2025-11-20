#!/bin/bash

# Theme wallpapers directory
ubudongs_wallpapers_base="$HOME/.local/share/backgrounds/dongs/wallpapers"
ubudongs_lockscreens_base="$HOME/.local/share/backgrounds/dongs/lockscreens"

# Find current main screen resolution
screen_resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')

# Check if current resolution wallpapers exist
if [ ! -d "$ubudongs_wallpapers_base/@${screen_resolution}" ]; then
    # If not found, fallback to 4k
    ubudongs_wallpaper_resolution="3840x2160"
else
    ubudongs_wallpaper_resolution="$screen_resolution"
fi
# Check if current resolution lockscreens exist
if [ ! -d "$ubudongs_lockscreens_base/@${screen_resolution}" ]; then
    # If not found, fallback to 4k
    ubudongs_lockscreen_resolution="3840x2160"
else
    ubudongs_lockscreen_resolution="$screen_resolution"
fi

# Find the current wallpaper and lockscreen name
current_wallpaper=$(gsettings get org.gnome.desktop.background picture-uri | sed "s/'//g" | sed 's|file://||' | xargs basename)
current_lockscreen=$(gsettings get org.gnome.desktop.screensaver picture-uri | sed "s/'//g" | sed 's|file://||' | xargs basename)

# Set the next wallpaper and lockscreen
updated_wallpaper="$ubudongs_wallpapers_base/@${ubudongs_wallpaper_resolution}/$current_wallpaper"
gsettings set org.gnome.desktop.background picture-uri "file://$updated_wallpaper"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$updated_wallpaper"

updated_lockscreen="$ubudongs_lockscreens_base/@${ubudongs_lockscreen_resolution}/$current_lockscreen"
gsettings set org.gnome.desktop.screensaver picture-uri "file://$updated_lockscreen"
