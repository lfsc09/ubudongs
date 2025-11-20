#!/bin/bash

# Configure the bash shell using Ubudongs defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/ubudongs/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/ubudongs/defaults/bash/shell

# Load gnome terminal profile configs
default_profile=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
echo "[:$default_profile]" > /tmp/gnome-terminal.default
cat ~/.local/share/ubudongs/configs/gnome-terminal >> /tmp/gnome-terminal.default
cat /tmp/gnome-terminal.default | dconf load /org/gnome/terminal/legacy/profiles:/
rm /tmp/gnome-terminal.default
