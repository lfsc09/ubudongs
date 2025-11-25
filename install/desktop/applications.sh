#!/bin/bash

APP_DEST_DIR="$HOME/.local/share/applications"

# Copy application icons
ICONS_DEST_DIR="$APP_DEST_DIR/icons"
if [ ! -d "$ICONS_DEST_DIR" ]; then mkdir -p "$ICONS_DEST_DIR"; fi
cp ~/.local/share/ubudongs/applications/icons/*.png "$ICONS_DEST_DIR/"

for script in ~/.local/share/ubudongs/applications/*.sh; do source $script; done
