#!/bin/bash
set -e

# Check the distribution name and version and abort if incompatible
source $UBUDONGS_PATH/install/check-version.sh

# Ask for some choices and information
log_skipline
log_action "Get ready to make a few choices..."
source $UBUDONGS_PATH/install/terminal/required/app-gum.sh >/dev/null
source $UBUDONGS_PATH/install/select-optional-apps.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing (These will not be reverted later)
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  # Install essential tools and tweaks
  source $UBUDONGS_PATH/install/essential.sh

  # Install terminal tools
  source $UBUDONGS_PATH/install/terminal.sh

  # Install desktop tools and tweaks
  source $UBUDONGS_PATH/install/desktop.sh

  # Clean up
  source $UBUDONGS_PATH/install/cleanup.sh

  # Reboot to pickup changes
  gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot || true
else
  log_skipline
  log_error "This installation requires GNOME desktop environment"
  exit 1
fi
