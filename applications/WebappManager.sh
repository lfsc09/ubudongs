#!/bin/bash

desktop_file="$APPLICATIONS_DEST_DIR/WebappManager.desktop"

cat <<EOF >"$desktop_file"
[Desktop Entry]
Version=1.0
Name=Webapp Manager
Comment=Create your own web app shortcuts
Exec=gnome-terminal --title=WebappManager -- webapp-manager
Terminal=false
Type=Application
Icon=$APPLICATIONS_DEST_DIR/icons/WebappManager.png
Categories=GTK;
StartupNotify=false
EOF

chmod +x "$desktop_file"
