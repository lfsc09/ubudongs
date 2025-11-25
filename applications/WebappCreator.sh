#!/bin/bash

DESKTOP_FILE="$APP_DEST_DIR/WebappCreator.desktop"

cat <<EOF >"$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Name=Webapp Creator
Comment=Create your own web app shortcuts
Exec=gnome-terminal --title=WebappCreator -- /usr/local/bin/ubudongs/webapp-create.run.sh
Terminal=false
Type=Application
Icon=$APP_DEST_DIR/icons/WebappCreator.png
Categories=GTK;
StartupNotify=false
EOF

chmod +x "$DESKTOP_FILE"
