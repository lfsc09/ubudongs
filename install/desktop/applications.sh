#!/bin/bash

export APPLICATIONS_DEST_DIR="$HOME/.local/share/applications"

# Copy application icons
application_icons_dest_dir="$APPLICATIONS_DEST_DIR/icons"
if [ ! -d "$application_icons_dest_dir" ]; then mkdir -p "$application_icons_dest_dir"; fi
cp $UBUDONGS_PATH/applications/icons/*.png "$application_icons_dest_dir/"

for script in $UBUDONGS_PATH/applications/*.sh; do source $script; done
