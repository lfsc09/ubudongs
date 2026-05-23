#!/bin/bash

############################
# Change Ubuntu theme color
############################
ubuntu_theme_color="bark"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$ubuntu_theme_color-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$ubuntu_theme_color"
gsettings set org.gnome.desktop.interface accent-color "$ubuntu_theme_color" 2>/dev/null || true

######################
# Change cursor theme
######################
# Extract and copy the custom cursors theme if not already installed
ubudongs_cursor_dest_dir="/usr/share/icons"
sudo tar -xf "$UBUDONGS_PATH/themes/dongs/cursors/bibata-modern-classic.tar.xz" -C "$ubudongs_cursor_dest_dir"
sudo tar -xf "$UBUDONGS_PATH/themes/dongs/cursors/breezex-dark.tar.xz" -C "$ubudongs_cursor_dest_dir"

# If extracted, try to set Breeze cursor theme
if [ -d "$ubudongs_cursor_dest_dir/BreezeX-Dark" ]; then
    gsettings set org.gnome.desktop.interface cursor-theme 'BreezeX-Dark'
else
    # If Breeze did not extract, try Bibata, else fallback to Yaru
    if [ -d "$ubudongs_cursor_dest_dir/Bibata-Modern-Classic" ]; then
        gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
    else
        gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
    fi
fi

######################################################
# Setup Wallpapers & User avatar
######################################################

#############
# Wallpapers
#############
ubudongs_wallpapers_base_dir="$UBUDONGS_PATH/themes/dongs/wallpapers"
# Theme wallpapers destination directory
ubudongs_images_dest_dir="$HOME/.local/share/backgrounds"
# Default wallpaper filename
ubudongs_default_wallpaper="ubuntu-minimal.jpg"

# Add all theme wallpapers
mkdir -p $ubudongs_images_dest_dir
cp -r $ubudongs_wallpapers_base_dir/* $ubudongs_images_dest_dir

# Get the default wallpaper
ubudongs_wallpaper_filepath="$ubudongs_images_dest_dir/${ubudongs_default_wallpaper}"

# Set default wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$ubudongs_wallpaper_filepath"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$ubudongs_wallpaper_filepath"
gsettings set org.gnome.desktop.background picture-options 'zoom'

##############
# User avatar
##############
ubudongs_default_user_image="user.png"

# User avatar destination file
avatar_image_path="$HOME/.face"

# Add user default image
ubudongs_user_image="$UBUDONGS_PATH/themes/dongs/${ubudongs_default_user_image}"
cp $ubudongs_user_image $avatar_image_path
