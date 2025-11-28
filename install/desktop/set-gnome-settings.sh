#!/bin/bash

# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Turn off ambient sensors for setting screen brightness (they rarely work well!)
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

# Set Desktop icons to not show Home folder
gsettings set org.gnome.shell.extensions.ding show-home false

# Set Dock icon size to 24 pixels
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
# Set Dock position to bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
# Set Dock behavior to not show volumes and devices
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network false
# Set Dock behavior to not show trash
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.ding show-trash false

# Set Notifications to not show in lock screen
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

# Set Mouse speed (range is -1 to 1)
gsettings set org.gnome.desktop.peripherals.mouse speed -0.8
# Set Mouse cursor size
gsettings set org.gnome.desktop.interface cursor-size 64

# Set Regional Formats to United Kingdom
gsettings set org.gnome.system.locale region "en_GB.UTF-8"

# Set Clock & Calendar to show week day
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Disable automatic screen blanking
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false

# Disable top accessibility menu icon
gsettings set org.gnome.desktop.a11y always-show-universal-access-status false

# Enable to show hidden files by default in Nautilus
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true

# Set Nautilus (Files) default view to List View
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# Change configurations of Gnome Text Editor
gsettings set org.gnome.TextEditor auto-indent true
gsettings set org.gnome.TextEditor auto-save-delay uint32 3
gsettings set org.gnome.TextEditor custom-font 'FiraCode Nerd Font 11'
gsettings set org.gnome.TextEditor discover-settings true
gsettings set org.gnome.TextEditor enable-snippets false
gsettings set org.gnome.TextEditor highlight-current-line true
gsettings set org.gnome.TextEditor highlight-matching-brackets true
gsettings set org.gnome.TextEditor indent-style 'space'
gsettings set org.gnome.TextEditor indent-width -1
gsettings set org.gnome.TextEditor last-save-directory ''
gsettings set org.gnome.TextEditor line-height 1.2
gsettings set org.gnome.TextEditor recolor-window true
gsettings set org.gnome.TextEditor restore-session false
gsettings set org.gnome.TextEditor right-margin-position uint32 120
gsettings set org.gnome.TextEditor show-grid false
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor show-map true
gsettings set org.gnome.TextEditor show-right-margin true
gsettings set org.gnome.TextEditor spellcheck false
gsettings set org.gnome.TextEditor style-scheme 'solarized-dark'
gsettings set org.gnome.TextEditor style-variant 'follow'
gsettings set org.gnome.TextEditor tab-width uint32 2
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.TextEditor wrap-text true

# Create default home Work folder
mkdir -p ~/Work
