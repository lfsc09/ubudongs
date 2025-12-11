#!/bin/bash

# Load gnome-terminal profile configs
default_profile_id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
echo "[:$default_profile_id]" > /tmp/gnome-terminal.default
cat $UBUDONGS_PATH/configs/gnome-terminal/config >> /tmp/gnome-terminal.default
cat /tmp/gnome-terminal.default | dconf load /org/gnome/terminal/legacy/profiles:/
rm /tmp/gnome-terminal.default