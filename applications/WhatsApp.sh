#!/bin/bash

desktop_file="$APPLICATIONS_DEST_DIR/WhatsApp.desktop"

cat <<EOF >"$desktop_file"
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=google-chrome --app="https://web.whatsapp.com" --name=WhatsApp --class=Whatsapp
Terminal=false
Type=Application
Icon=$APPLICATIONS_DEST_DIR/icons/WhatsApp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF

chmod +x "$desktop_file"
