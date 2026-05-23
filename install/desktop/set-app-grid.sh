#!/bin/bash

print_header "App Grid configuration"

# App doesn't do anything when started from the app grid
sudo rm -rf /usr/share/applications/org.flameshot.Flameshot.desktop

# Remove vim entry as it's terminal based
sudo rm -rf /usr/share/applications/vim.desktop

# Remove the ImageMagick icon
sudo rm -rf /usr/share/applications/display-im6.q16.desktop
sudo rm -rf /usr/share/applications/display-im7.q16.desktop

# Update and create folders
gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'YaST', 'Pardus', 'WebApps']"
# Default ubuntu app-folder
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ apps "['gnome-abrt.desktop', 'gnome-system-log.desktop', 'nm-connection-editor.desktop', 'org.gnome.baobab.desktop', 'org.gnome.Connections.desktop', 'org.gnome.DejaDup.desktop', 'org.gnome.Dictionary.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.Evince.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.fonts.desktop', 'org.gnome.Loupe.desktop', 'org.gnome.seahorse.Application.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Usage.desktop', 'vinagre.desktop', 'gnome-language-selector.desktop', 'nvidia-settings.desktop', 'software-properties-drivers.desktop', 'firmware-updater_firmware-updater.desktop', 'org.gnome.clocks.desktop', 'org.gnome.PowerStats.desktop', 'software-properties-gtk.desktop', 'update-manager.desktop', 'gnome-session-properties.desktop', 'org.gnome.eog.desktop']"
# Custom app-folders
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/WebApps/ name 'WebApps'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/WebApps/ apps "[]"

log_skipline
log_success "App Grid configured"
print_footer
