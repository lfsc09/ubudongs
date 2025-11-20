#!/bin/bash

# Theme color
UBUDONGS_THEME_COLOR="purple"

# Default wallpaper filename
UBUDONGS_DEFAULT_WALLPAPER="evening-landscape.jpg"
UBUDONGS_DEFAULT_LOCKSCREEN="ubuntu-minimal.jpg"
UBUDONGS_DEFAULT_USER="user.png"
# Find current main screen resolution
UBUDONGS_SCREEN_RESOLUTION=$(xdpyinfo | grep dimensions | awk '{print $2}')
# Theme images destination directory
UBUDONGS_DEST_DIR="$HOME/.local/share/backgrounds/dongs"
if [ ! -d "$UBUDONGS_DEST_DIR" ]; then mkdir -p "$UBUDONGS_DEST_DIR"; fi
# User avatar destination directory
AVATAR_DEST_DIR="$HOME/.face"
if [ ! -d "$AVATAR_DEST_DIR" ]; then mkdir -p "$AVATAR_DEST_DIR"; fi

# Check wallpapers for the current resolution
UBUDONGS_WALLPAPERS_BASE="$UBUDONGS_PATH/themes/dongs/wallpapers"
if [ ! -d "$UBUDONGS_WALLPAPERS_BASE/@${UBUDONGS_SCREEN_RESOLUTION}" ]; then
    # If not found, fallback to 4k
    UBUDONGS_WALLPAPER_RESOLUTION="3840x2160"
else
    UBUDONGS_WALLPAPER_RESOLUTION="$UBUDONGS_SCREEN_RESOLUTION"
fi

# Add all theme wallpapers
cp -r $UBUDONGS_WALLPAPERS_BASE $UBUDONGS_DEST_DIR

# Check lockscreen for the current resolution
UBUDONGS_LOCKSCREENS_BASE="$UBUDONGS_PATH/themes/dongs/lockscreens"
if [ ! -d "$UBUDONGS_LOCKSCREENS_BASE/@${UBUDONGS_SCREEN_RESOLUTION}" ]; then
    # If not found, fallback to 4k
    UBUDONGS_LOCKSCREEN_RESOLUTION="3840x2160"
else
    UBUDONGS_LOCKSCREEN_RESOLUTION="$UBUDONGS_SCREEN_RESOLUTION"
fi

# Add all theme lockscreens
cp -r $UBUDONGS_LOCKSCREENS_BASE $UBUDONGS_DEST_DIR

# Add user default image
UBUDONGS_USER_IMAGE="$UBUDONGS_PATH/themes/dongs/${UBUDONGS_DEFAULT_USER}"
cp $UBUDONGS_USER_IMAGE $AVATAR_DEST_DIR

# Get the default wallpaper
UBUDONGS_THEME_BACKGROUND="$UBUDONGS_DEST_DIR/wallpapers/@${UBUDONGS_WALLPAPER_RESOLUTION}/${UBUDONGS_DEFAULT_WALLPAPER}"
# Get the default lockscreen
UBUDONGS_THEME_LOCKSCREEN="$UBUDONGS_DEST_DIR/lockscreens/@${UBUDONGS_LOCKSCREEN_RESOLUTION}/${UBUDONGS_DEFAULT_LOCKSCREEN}"
source $UBUDONGS_PATH/themes/set-gnome-theme.sh
