#!/bin/bash

# Theme wallpapers directory
ubudongs_wallpapers_base="$HOME/.local/share/backgrounds/dongs/wallpapers"

# Find current main screen resolution
screen_resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')

# Check if current resolution wallpapers exist
if [ ! -d "$ubudongs_wallpapers_base/@${screen_resolution}" ]; then
    # If not found, fallback to 4k
    ubudongs_wallpaper_resolution="3840x2160"
else
    ubudongs_wallpaper_resolution="$screen_resolution"
fi

# Find the index of the current wallpaper in the folder
current_wallpaper=$(gsettings get org.gnome.desktop.background picture-uri | sed "s/'//g" | sed 's|file://||')
wallpaper_folder="$ubudongs_wallpapers_base/@${ubudongs_wallpaper_resolution}/"
wallpaper_files=("$wallpaper_folder"*.jpg)
current_index=-1
for i in "${!wallpaper_files[@]}"; do
    if [[ "${wallpaper_files[$i]}" == "$current_wallpaper" ]]; then
        current_index=$i
        break
    fi
done

# Get the next wallpaper index (cycle back to 0 if at the end)
if [ $current_index -eq -1 ] || [ $current_index -eq $((${#wallpaper_files[@]} - 1)) ]; then
    next_index=0
else
    next_index=$((current_index + 1))
fi

# Set the next wallpaper
next_wallpaper="${wallpaper_files[$next_index]}"
gsettings set org.gnome.desktop.background picture-uri "file://$next_wallpaper"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$next_wallpaper"
