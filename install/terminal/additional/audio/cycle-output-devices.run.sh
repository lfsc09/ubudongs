#!/bin/bash

# Get a list of all sink names
sink_names=($(pactl list short sinks | awk '{print $2}'))

# Check the config file for selected sinks
config_file="$HOME/.config/cycle-output-devices.conf"
if [[ ! -f "$config_file" ]]; then
  # Run the setup script in current terminal or new terminal if not found
  if [[ -n "$TERM" && "$TERM" != "dumb" ]]; then
    bash cycle-output-devices.setup
  else
    x-terminal-emulator -e bash cycle-output-devices.setup
  fi
  sleep 1
fi

# Read the selected sinks from the config file
mapfile -t selected_sinks < "$config_file"

# Filter out only valid (currently available) sinks from the selected list
valid_sinks=()
for sink in "${selected_sinks[@]}"; do
  # Skip empty lines
  [[ -z "$sink" ]] && continue
  
  if [[ " ${sink_names[*]} " =~ " ${sink} " ]]; then
    valid_sinks+=("$sink")
  fi
done

# Check if we have at least one valid sink
if [[ ${#valid_sinks[@]} -eq 0 ]]; then
  notify-send "Cycle Output Devices - Error" "No valid audio devices available. Setup again with `<Ctrl><Super><Shift>backslash`." -i audio-speakers -h string:transient:true
  exit 1
fi

# Get the current default sink name
current_sink=$(pactl info | grep 'Default Sink:' | awk '{print $3}')

# If the current sink is not in the valid list, set to the first valid sink
if [[ ! " ${valid_sinks[*]} " =~ " ${current_sink} " ]]; then
  pactl set-default-sink "${valid_sinks[0]}"
  device_description=$(pactl list sinks | grep -A 100 "Name: ${valid_sinks[0]}" | grep "Description:" | awk '{$1=""; print $0}' | xargs)
  notify-send "Audio Output Switched" "$device_description" -i audio-speakers -h string:transient:true
  exit 0
fi

# Get the index of the current sink in the valid sinks array
current_index=-1
for i in "${!valid_sinks[@]}"; do
  if [[ "${valid_sinks[$i]}" == "${current_sink}" ]]; then
    current_index=${i}
    break
  fi
done

# Calculate the index of the next sink (cycle back to 0 if at the end)
next_index=$(((current_index + 1) % ${#valid_sinks[@]}))
next_sink_name=${valid_sinks[$next_index]}

# Set the new default sink
pactl set-default-sink "$next_sink_name"

# Move all active streams to the new sink (optional, but ensures active apps switch)
# In newer Ubuntu versions (22.04+), this might be automatic
pactl list short sink-inputs | while read -r line; do
  input_index=$(echo "$line" | awk '{print $1}')
  pactl move-sink-input "$input_index" "$next_sink_name" 2>/dev/null
done

device_description=$(pactl list sinks | grep -A 100 "Name: $next_sink_name" | grep "Description:" | awk '{$1=""; print $0}' | xargs)
notify-send "Audio Output Switched" "$device_description" -i audio-speakers -h string:transient:true