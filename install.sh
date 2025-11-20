#!/bin/bash
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/ubudongs/install/check-version.sh

# Ask for some choices and information
echo "Get ready to make a few choices..."
source ~/.local/share/ubudongs/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/ubudongs/install/select-optional-apps.sh
source ~/.local/share/ubudongs/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing (These will not be reverted later)
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/.local/share/ubudongs/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/ubudongs/install/desktop.sh

  # Clean up
  source ~/.local/share/ubudongs/install/cleanup.sh
else
  echo -e "${RED}[Error]${NC} This installation requires GNOME desktop environment."
  exit 1
fi
