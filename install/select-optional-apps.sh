#!/bin/bash

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  optional_apps=("Datagrip" "Obs Studio" "Solaar" "Steam" "Virtual Box" "Zoom")
  default_optional_apps='Datagrip,Solaar'
  export UBUDONGS_SELECTED_OPTIONAL_APPS=$(gum choose "${optional_apps[@]}" --no-limit --selected $default_optional_apps --height 7 --header "Select optional apps" | tr ' ' '-')
fi
