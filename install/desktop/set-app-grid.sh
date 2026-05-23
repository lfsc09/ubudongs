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
gsettings set org.gnome.desktop.app-folders folder-children "['System', 'Utilities', 'YaST', 'Pardus', 'WebApps']"
# Default ubuntu app-folders
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/System/ apps "['nm-connection-editor.desktop', 'org.gnome.baobab.desktop', 'org.gnome.DiskUtility.desktop', 'im-config.desktop', 'org.gnome.Logs.desktop', 'org.gnome.Sysprof.desktop', 'desktop-security-center_desktop-security-center.desktop', 'update-manager.dektop', 'firmware-updater_firmware-updater.desktop']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ apps "['org.gnome.Papers.desktop', 'org.gnome.font-viewer.desktop' ,'org.gnome.Loupe.desktop', 'org.gnome.seahorse.Application.desktop', 'org.gnome.Characters.desktop', 'org.gnome.clocks.desktop', 'gnome-language-selector.desktop', 'nvidia-settings.desktop']"
# Custom app-folder
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/WebApps/ name 'WebApps'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/WebApps/ apps "[]"

log_skipline
log_success "App Grid configured"
print_footer
