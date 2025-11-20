#!/bin/bash

# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run terminal installers
for installer in ~/.local/share/ubudongs/install/terminal/*.sh; do source $installer; done

# Add additional ubudongs tool scripts
UBUDONGS_ADDITIONAL_TOOLS_DIR="/usr/local/bin/ubudongs"
if [ ! -d "$UBUDONGS_ADDITIONAL_TOOLS_DIR" ]; then sudo mkdir -p "$UBUDONGS_ADDITIONAL_TOOLS_DIR"; fi
shopt -s globstar
for script in ~/.local/share/ubudongs/install/terminal/additional/**/install.sh; do
  [ -f "$script" ] && source "$script"
done
shopt -u globstar
