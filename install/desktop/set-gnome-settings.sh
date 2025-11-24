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

# Create default home Work folder
mkdir -p ~/Work
