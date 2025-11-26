#!/bin/bash

desktop_file="$APPLICATIONS_DEST_DIR/DongsInfo.desktop"

cat <<EOF >$desktop_file
[Desktop Entry]
Version=1.0
Name=DongsInfo
Comment=Show system information using fastfetch
Exec=gnome-terminal --title=DongsInfo -- dongs
Terminal=false
Type=Application
Icon=$APPLICATIONS_DEST_DIR/icons/DongsInfo.png
Categories=GTK;
StartupNotify=false
EOF

chmod +x "$desktop_file"
