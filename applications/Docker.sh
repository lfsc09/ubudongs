#!/bin/bash

DESKTOP_FILE="$APP_DEST_DIR/Docker.desktop"

cat <<EOF >$DESKTOP_FILE
[Desktop Entry]
Version=1.0
Name=Docker
Comment=Manage Docker containers with LazyDocker
Exec=gnome-terminal --title=Docker -- lazydocker
Terminal=false
Type=Application
Icon=$APP_DEST_DIR/icons/Docker.png
Categories=GTK;
StartupNotify=false
EOF

chmod +x "$DESKTOP_FILE"
