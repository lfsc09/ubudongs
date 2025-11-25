#!/bin/bash

DESKTOP_FILE="$APP_DEST_DIR/WhatsApp.desktop"

cat <<EOF >"$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=google-chrome --app="https://web.whatsapp.com" --name=WhatsApp --class=Whatsapp
Terminal=false
Type=Application
Icon=$APP_DEST_DIR/icons/WhatsApp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF

chmod +x "$DESKTOP_FILE"
