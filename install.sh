#!/bin/bash
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/ubudongs/install/check-version.sh

# Ask for some choices and information
echo -e "${BLUE}\n[Info] Get ready to make a few choices...${NC}"
source ~/.local/share/ubudongs/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/ubudongs/install/select-optional-apps.sh
source ~/.local/share/ubudongs/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing (These will not be reverted later)
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo -e "${BLUE}[Info] Installing terminal and desktop tools...${NC}"

  # Install terminal tools
  source ~/.local/share/ubudongs/install/terminal.sh
  echo -e "${GREEN}\n[OK] Terminal tools installed.${NC}\n"

  # Install desktop tools and tweaks
  source ~/.local/share/ubudongs/install/desktop.sh
  echo -e "${GREEN}\n[OK] Desktop tools and tweaks installed.${NC}\n"

  # Clean up
  source ~/.local/share/ubudongs/install/cleanup.sh
  echo -e "${GREEN}\n[OK] Cleanup completed.${NC}\n"

  # Reboot to pickup changes
  gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot || true
else
  echo -e "${RED}\n[Error] This installation requires GNOME desktop environment.${NC}"
  exit 1
fi
