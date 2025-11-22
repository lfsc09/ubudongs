#!/bin/bash

sudo apt install -y gnome-shell-extension-manager gir1.2-gtop-2.0 gir1.2-clutter-1.0
pipx install gnome-extensions-cli --system-site-packages

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Ready?"

# Install new extensions
gext install tophat@fflewddur.github.io
gext install AlphabeticalAppGrid@stuarthayhurst
gext install caffeine@patapon.info

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/caffeine@patapon.info/schemas/org.gnome.shell.extensions.caffeine.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat cpu-display 'both'
gsettings set org.gnome.shell.extensions.tophat cpu-show-cores false
gsettings set org.gnome.shell.extensions.tophat fs-display 'both'
gsettings set org.gnome.shell.extensions.tophat fs-hide-in-menu ''
gsettings set org.gnome.shell.extensions.tophat group-procs true
gsettings set org.gnome.shell.extensions.tophat mem-abs-units true
gsettings set org.gnome.shell.extensions.tophat mem-display 'both'
gsettings set org.gnome.shell.extensions.tophat meter-fg-color '#924d8b'
gsettings set org.gnome.shell.extensions.tophat mount-to-monitor '/'
gsettings set org.gnome.shell.extensions.tophat network-device ''
gsettings set org.gnome.shell.extensions.tophat network-usage-unit 'bytes'
gsettings set org.gnome.shell.extensions.tophat position-in-panel 'left'
gsettings set org.gnome.shell.extensions.tophat refresh-rate 'medium'
gsettings set org.gnome.shell.extensions.tophat show-cpu true
gsettings set org.gnome.shell.extensions.tophat show-disk true
gsettings set org.gnome.shell.extensions.tophat show-fs true
gsettings set org.gnome.shell.extensions.tophat show-icons true
gsettings set org.gnome.shell.extensions.tophat show-mem true
gsettings set org.gnome.shell.extensions.tophat show-menu-actions true
gsettings set org.gnome.shell.extensions.tophat show-net true
gsettings set org.gnome.shell.extensions.tophat use-system-accent true

# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'

# Configure Caffeine
gsettings set org.gnome.shell.extensions.caffeine cli-toggle true

# Configure default Ubuntu Tiling Assistant
gsettings set org.gnome.shell.extensions.tiling-assistant active-window-hint 0
gsettings set org.gnome.shell.extensions.tiling-assistant dynamic-keybinding-behavior 1
gsettings set org.gnome.shell.extensions.tiling-assistant enable-raise-tile-group false
gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup false
gsettings set org.gnome.shell.extensions.tiling-assistant maximize-with-gap true
gsettings set org.gnome.shell.extensions.tiling-assistant single-screen-gap 6
gsettings set org.gnome.shell.extensions.tiling-assistant window-gap 6
gsettings set org.gnome.shell.extensions.tiling-assistant restore-window '[]'
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottomleft-quarter "['<Super><Shift>comma']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottom-half "['<Super><Shift>period']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-bottomright-quarter "['<Super><Shift>slash']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-left-half "['<Super><Shift>l']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-maximize "['<Super><Shift>semicolon']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-right-half "['<Super><Shift>apostrophe']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-topleft-quarter "['<Super><Shift>p']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-top-half "['<Super><Shift>bracketleft']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-topright-quarter "['<Super><Shift>bracketright']"
