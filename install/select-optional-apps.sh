#!/bin/bash

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  OPTIONAL_APPS=("Datagrip" "Obs Studio" "Solaar" "Steam" "Virtual Box" "Zoom")
  DEFAULT_OPTIONAL_APPS='Datagrip,Solaar'
  export UBUDONGS_SELECTED_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')
fi
