#!/bin/bash

create_web_app() {
  # Clear the terminal for better readability
  clear

  echo -e "\e[32mLet's create a new web app.\n\e[0m"
  local app_name=$(gum input --prompt "Name> " --placeholder "My favorite web app")
  local app_url=$(gum input --prompt "URL> " --placeholder "https://example.com")
  local icon_ref=$(gum input --prompt "Icon URL> " --placeholder "See https://dashboardicons.com (must use PNG!)")

  # Normalize app name (replace spaces with dashes)
  app_name=$(echo "$app_name" | tr ' ' '-')

  # Ensure valid execution
  if [[ -z "$app_name" || -z "$app_url" || -z "$icon_ref" ]]; then
    echo "You must set app name, app URL, and icon URL!"
    exit 1
  fi

  # Refer to local icon or fetch remotely from URL
  local icon_dir="$HOME/.local/share/applications/icons"
  mkdir -p "$icon_dir"
  if [[ $icon_ref =~ ^https?:// ]]; then
    local icon_path="$icon_dir/$app_name.png"
    if ! curl -sL -o "$icon_path" "$icon_ref"; then
      echo "Error: Failed to download icon."
      exit 1
    fi
  else
    local icon_path="$icon_dir/$icon_ref"
  fi

  # Create application .desktop file
  local desktop_file="$HOME/.local/share/applications/$app_name.desktop"

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

  # Add to app grid
  local schema="org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/WebApps/"
  local raw_apps=$(gsettings get $schema apps)

  if [[ "$raw_apps" == "@as []" || "$raw_apps" == "[]" ]]; then
    gsettings set $schema apps "['$app_name.desktop']"
  elif [[ "$raw_apps" != *"'$app_name.desktop'"* ]]; then
    local inner="${raw_apps:1:${#raw_apps}-2}"
    gsettings set $schema apps "['$app_name.desktop', $inner]"
  fi

  echo -e "\e[32m[Ok] You can now find $app_name in the app grid folder 'WebApps'\n\e[0m"
}

delete_web_apps() {
  # Clear the terminal for better readability
  clear

  echo -e "\e[32mSelect the web apps to delete.\n\e[0m"
  local schema="org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/WebApps/"
  local raw=$(gsettings get $schema apps)

  if [[ "$raw" == "@as []" || "$raw" == "[]" ]]; then
    echo "No web apps found in 'WebApps' folder."
    exit 0
  fi

  local apps=$(echo "$raw" | tr -d "[],'")
  local app_array=($apps)

  local choice=$(gum choose --no-limit "${app_array[@]}")

  if [[ -z "$choice" ]]; then
    echo "No app selected."
    exit 1
  fi

  for app in $choice; do
    local desktop_file="$HOME/.local/share/applications/$app"
    if [[ -f "$desktop_file" ]]; then
      local icon_file=$(grep "^Icon=" "$desktop_file" | cut -d'=' -f2)
      rm "$desktop_file"
      [[ -n "$icon_file" && -f "$icon_file" ]] && rm "$icon_file"
      echo -e "\e[32mDeleted $app from applications.\n\e[0m"
    else
      echo -e "\e[33m[Warning] $app not found in applications.\n\e[0m"
    fi

    # Remove from app grid
    local raw_apps=$(gsettings get $schema apps)
    local updated_apps=$(echo "$raw_apps" | sed "s/'$app', //;s/, '$app'//;s/'$app'//")
    gsettings set $schema apps "$updated_apps"
  done

  echo -e "\e[32m[Ok] Selected web apps have been deleted.\n\e[0m"
}

echo -e "\e[32mWhat would you like to do?\n\e[0m"
options=(
  "Create a new web app"
  "Delete existing web apps"
)
choice=$(gum choose "${options[@]}")

if [[ "$choice" == "Create a new web app" ]]; then
  create_web_app
elif [[ "$choice" == "Delete existing web apps" ]]; then
  delete_web_apps
else
  echo "Invalid choice."
  exit 1
fi
