#!/bin/bash

print_header "Install ubudongs apps"

export APPLICATIONS_DEST_DIR="$HOME/.local/share/applications"

# Copy application icons
application_icons_dest_dir="$APPLICATIONS_DEST_DIR/icons"
mkdir -p "$application_icons_dest_dir"
cp $UBUDONGS_PATH/applications/icons/*.png "$application_icons_dest_dir/"

for script in $UBUDONGS_PATH/applications/*.sh; do source $script; done

echo ""
log_success "Ubudongs apps installed"
print_footer
