#!/bin/bash

desktop_file="$APPLICATIONS_DEST_DIR/WebappCreator.desktop"

cat <<EOF >"$desktop_file"
[Desktop Entry]
Version=1.0
Name=Webapp Creator
Comment=Create your own web app shortcuts
Exec=gnome-terminal --title=WebappCreator -- /usr/local/bin/ubudongs/webapp-create.run.sh
Terminal=false
Type=Application
Icon=$APPLICATIONS_DEST_DIR/icons/WebappCreator.png
Categories=GTK;
StartupNotify=false
EOF

chmod +x "$desktop_file"
