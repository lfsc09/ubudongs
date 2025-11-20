#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Choose the devices to cycle through
config_file="$HOME/.config/cycle-output-devices.conf"
mkdir -p "$(dirname "$config_file")"

echo -e "${GREEN}Select the audio output devices you want to cycle through:${NC}"
pactl list short sinks | awk '{print $2}' | \
gum choose --no-limit > "$config_file"

echo -e "${GREEN}[OK]${NC} Configuration saved."
