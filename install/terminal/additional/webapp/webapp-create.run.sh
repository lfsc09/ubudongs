#!/bin/bash

echo -e "\e[32mLet's create a new web app you can start.\n\e[0m"
APP_NAME=$(gum input --prompt "Name> " --placeholder "My favorite web app")
APP_URL=$(gum input --prompt "URL> " --placeholder "https://example.com")
ICON_REF=$(gum input --prompt "Icon URL> " --placeholder "See https://dashboardicons.com (must use PNG!)")

# Ensure valid execution
if [[ -z "$APP_NAME" || -z "$APP_URL" || -z "$ICON_REF" ]]; then
  echo "You must set app name, app URL, and icon URL!"
  exit 1
fi

# Refer to local icon or fetch remotely from URL
ICON_DIR="$HOME/.local/share/applications/icons"
if [[ $ICON_REF =~ ^https?:// ]]; then
  ICON_PATH="$ICON_DIR/$APP_NAME.png"
  if curl -sL -o "$ICON_PATH" "$ICON_REF"; then
    ICON_PATH="$ICON_DIR/$APP_NAME.png"
  else
    echo "Error: Failed to download icon."
    exit 1
  fi
else
  ICON_PATH="$ICON_DIR/$ICON_REF"
fi

# Create application .desktop file
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"

cat >"$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=$APP_NAME
Exec=google-chrome --app="$APP_URL" --name="$APP_NAME" --class="$APP_NAME"
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupNotify=true
EOF

chmod +x "$DESKTOP_FILE"

echo -e "\033[0;32m[Ok] You can now find $APP_NAME in the app grid\n\033[0m"
