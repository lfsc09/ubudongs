#!/bin/bash

# Configure the bash shell using Ubudongs defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp $UBUDONGS_PATH/configs/bashrc ~/.bashrc

# Configure the inputrc using Ubudongs defaults
[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
cp $UBUDONGS_PATH/configs/inputrc ~/.inputrc

# Copy bash function definitions
[ -f ~/.bash_functions ] && mv ~/.bash_functions ~/.bash_functions.bak
cp $UBUDONGS_PATH/configs/bash_functions ~/.bash_functions

# Copy bash aliases
[ -f ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.bak
cp $UBUDONGS_PATH/configs/bash_aliases ~/.bash_aliases

# Load gnome-terminal profile configs
default_profile_id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
echo "[:$default_profile_id]" > /tmp/gnome-terminal.default
cat $UBUDONGS_PATH/configs/gnome-terminal/config >> /tmp/gnome-terminal.default
cat /tmp/gnome-terminal.default | dconf load /org/gnome/terminal/legacy/profiles:/
rm /tmp/gnome-terminal.default
