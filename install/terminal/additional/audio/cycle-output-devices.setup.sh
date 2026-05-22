#!/bin/bash

green='\033[0;32m'
nc='\033[0m' # No Color

# Choose the devices to cycle through
config_file="$HOME/.config/cycle-output-devices.conf"
mkdir -p "$(dirname "$config_file")"

echo -e "${green}Select the audio output devices you want to cycle through:${nc}"
pactl list short sinks | awk '{print $2}' | \
gum choose --no-limit > "$config_file"

echo -e "${green}[OK]${nc} Configuration saved."
