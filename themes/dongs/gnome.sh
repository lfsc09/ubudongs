#!/bin/bash

################################
# Change cursor theme to Bibata
################################
# Extract and copy the Bibata cursor theme if not already installed
ubudongs_cursor_dest_dir="/usr/share/icons"
sudo tar -xf "$UBUDONGS_PATH/themes/dongs/cursors/bibata-modern-classic.tar.gz" -C "$ubudongs_cursor_dest_dir"

# If extracted, set Bibata cursor theme, else fallback to Yaru
if [ -d "$ubudongs_cursor_dest_dir/Bibata-Modern-Classic" ]; then
    gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
else
    gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
fi

############################
# Change Ubuntu theme color
############################
ubuntu_theme_color="purple"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$ubuntu_theme_color-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$ubuntu_theme_color"
gsettings set org.gnome.desktop.interface accent-color "$ubuntu_theme_color" 2>/dev/null || true

######################################################
# Setup Wallpapers & Lockscreens images & User avatar
######################################################
# Find current main screen resolution
screen_resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')
# Theme images destination directory
ubudongs_images_dest_dir="$HOME/.local/share/backgrounds/dongs"
if [ ! -d "$ubudongs_images_dest_dir" ]; then mkdir -p "$ubudongs_images_dest_dir"; fi

#############
# Wallpapers
#############
# Default wallpaper filename
ubudongs_default_wallpaper="evening-landscape.jpg"

# Check wallpapers for the current resolution
ubudongs_wallpapers_base_dir="$UBUDONGS_PATH/themes/dongs/wallpapers"
if [ ! -d "$ubudongs_wallpapers_base_dir/@${screen_resolution}" ]; then
    # If not found, fallback to 4k
    ubudongs_wallpaper_resolution="3840x2160"
else
    ubudongs_wallpaper_resolution="$screen_resolution"
fi

# Add all theme wallpapers
cp -r $ubudongs_wallpapers_base_dir $ubudongs_images_dest_dir

# Get the default wallpaper
ubudongs_wallpaper_filepath="$ubudongs_images_dest_dir/wallpapers/@${ubudongs_wallpaper_resolution}/${ubudongs_default_wallpaper}"

# Set default wallpaper
gsettings set org.gnome.desktop.background picture-uri $ubudongs_wallpaper_filepath
gsettings set org.gnome.desktop.background picture-uri-dark $ubudongs_wallpaper_filepath
gsettings set org.gnome.desktop.background picture-options 'zoom'

##############
# Lockscreens
##############
ubudongs_default_lockscreen="ubuntu-minimal.jpg"

# Check lockscreen for the current resolution
ubudongs_lockscreens_base_dir="$UBUDONGS_PATH/themes/dongs/lockscreens"
if [ ! -d "$ubudongs_lockscreens_base_dir/@${screen_resolution}" ]; then
    # If not found, fallback to 4k
    ubudongs_lockscreen_resolution="3840x2160"
else
    ubudongs_lockscreen_resolution="$screen_resolution"
fi

# Add all theme lockscreens
cp -r $ubudongs_lockscreens_base_dir $ubudongs_images_dest_dir

# Get the default lockscreen
ubudongs_lockscreen_filepath="$ubudongs_images_dest_dir/lockscreens/@${ubudongs_lockscreen_resolution}/${ubudongs_default_lockscreen}"

# Set default lockscreen
gsettings set org.gnome.desktop.screensaver picture-uri $ubudongs_lockscreen_filepath
gsettings set org.gnome.desktop.screensaver picture-options 'zoom'

##############
# User avatar
##############
ubudongs_default_user_image="user.png"

# User avatar destination directory
avatar_image_dest_dir="$HOME/.face"
if [ ! -d "$avatar_image_dest_dir" ]; then mkdir -p "$avatar_image_dest_dir"; fi

# Add user default image
ubudongs_user_image="$UBUDONGS_PATH/themes/dongs/${ubudongs_default_user_image}"
cp $ubudongs_user_image $avatar_image_dest_dir

# Set user avatar using AccountsService
# Create/update the user configuration file for AccountsService
sudo mkdir -p /var/lib/AccountsService/users
sudo tee "/var/lib/AccountsService/users/$USER" > /dev/null <<EOF
[User]
Icon=$avatar_image_path
EOF

# Also create a .face symlink in home for compatibility
ln -sf "$avatar_image_path" "$HOME/.face"
