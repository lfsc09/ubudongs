#!/bin/bash

echo -e "\e[32mLet's create a new web app you can start.\n\e[0m"
app_name=$(gum input --prompt "Name> " --placeholder "My favorite web app")
app_url=$(gum input --prompt "URL> " --placeholder "https://example.com")
icon_ref=$(gum input --prompt "Icon URL> " --placeholder "See https://dashboardicons.com (must use PNG!)")

# Ensure valid execution
if [[ -z "$app_name" || -z "$app_url" || -z "$icon_ref" ]]; then
  echo "You must set app name, app URL, and icon URL!"
  exit 1
fi

# Refer to local icon or fetch remotely from URL
icon_dir="$HOME/.local/share/applications/icons"
if [[ $icon_ref =~ ^https?:// ]]; then
  icon_path="$icon_dir/$app_name.png"
  if curl -sL -o "$icon_path" "$icon_ref"; then
    icon_path="$icon_dir/$app_name.png"
  else
    echo "Error: Failed to download icon."
    exit 1
  fi
else
  icon_path="$icon_dir/$icon_ref"
fi

# Create application .desktop file
desktop_file="$HOME/.local/share/applications/$app_name.desktop"

cat >"$desktop_file" <<EOF
[Desktop Entry]
Version=1.0
Name=$app_name
Comment=$app_name
Exec=google-chrome --app="$app_url" --name="$app_name" --class="$app_name"
Terminal=false
Type=Application
Icon=$icon_path
StartupNotify=true
EOF

chmod +x "$desktop_file"

echo -e "\033[0;32m[Ok] You can now find $app_name in the app grid\n\033[0m"
