#!/bin/bash

export UBUDONGS_ADDITIONAL_TOOLS_DIR=${UBUDONGS_ADDITIONAL_TOOLS_DIR:-"/usr/local/bin/ubudongs"}

# Set Home Folder shortcut to Super+F
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>f']"
# Set Terminal shortcut to Super+Return
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"
# Set lauch browser shortcut to Super+B
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"

# Disable take a screenshot keybinding (we use flameshot instead)
gsettings set org.gnome.shell.keybindings screenshot '[]'
# Disable take a screenshot of a window keybinding
gsettings set org.gnome.shell.keybindings screenshot-window '[]'
# Disable take a screenshot interactively keybinding
gsettings set org.gnome.shell.keybindings show-screenshot-ui '[]'

# Disable focus active notification (conflicts with Super+n for Gnome Text Editor)
gsettings set org.gnome.shell.keybindings focus-active-notification '[]'

# Disable lauch help browser keybinding
gsettings set org.gnome.settings-daemon.plugins.media-keys help '[]'

# Reserve slots for custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/']"

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key 'Shift+Super+S'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'sh -c -- "flameshot gui"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Shift><Super>s'

# Set cycle audio output devices on Super+/
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Cycle Audio Output Devices'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "$UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.run.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control><Super>backslash'

# Set cycle wallpapers on CtrlSuper+Space
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Cycle Wallpapers'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "$UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-wallpapers.run.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Control><Super>space'

# Set gnome text editor on Super+n
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Gnome Text Editor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'gnome-text-editor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Super>n'
