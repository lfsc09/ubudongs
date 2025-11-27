#!/bin/bash

# Get a list of all sink names
sink_names=($(pactl list short sinks | awk '{print $2}'))

# Check the config file for selected sinks
config_file="$HOME/.config/cycle-output-devices.conf"
if [[ ! -f "$config_file" ]]; then
  # Run the setup script in current terminal or new terminal if not found
  if [[ -n "$TERM" && "$TERM" != "dumb" ]]; then
    bash /usr/local/bin/ubudongs/cycle-output-devices.setup.sh
  else
    x-terminal-emulator -e bash /usr/local/bin/ubudongs/cycle-output-devices.setup.sh
  fi
  sleep 1
fi

# Read the selected sinks from the config file
mapfile -t selected_sinks < "$config_file"

# Check if all the selected sinks are valid
for sink in "${selected_sinks[@]}"; do
  if [[ ! " ${sink_names[*]} " =~ " ${sink} " ]]; then
    notify-send "Cycle Output Devices - Error" "Selected sink '$sink' is not a valid sink. Please run the setup script again." -i audio-speakers -h string:transient:true
    exit 1
  fi
done

# Get the current default sink name
current_sink=$(pactl info | grep 'Default Sink:' | awk '{print $3}')

# If the current sink is not in the selected list, set to the first selected sink
if [[ ! " ${selected_sinks[*]} " =~ " ${current_sink} " ]]; then
  pactl set-default-sink "${selected_sinks[0]}"
  device_description=$(pactl list sinks | grep -A 100 "Name: ${selected_sinks[0]}" | grep "Description:" | awk '{$1=""; print $0}' | xargs)
  notify-send "Audio Output Switched" "$device_description" -i audio-speakers -h string:transient:true
  exit 0
fi

# Get the index of the current sink in the selected sinks array
current_index=-1
for i in "${!selected_sinks[@]}"; do
  if [[ "${selected_sinks[$i]}" == "${current_sink}" ]]; then
    current_index=${i}
    break
  fi
done

# Calculate the index of the next sink (cycle back to 0 if at the end)
next_index=$(((current_index + 1) % ${#selected_sinks[@]}))
next_sink_name=${selected_sinks[$next_index]}

# Set the new default sink
pactl set-default-sink "$next_sink_name"

# Move all active streams to the new sink (optional, but ensures active apps switch)
# In newer Ubuntu versions (22.04+), this might be automatic
pactl list short sink-inputs | while read -r line; do
  input_index=$(echo "$line" | awk '{print $1}')
  pactl move-sink-input "$input_index" "$next_sink_name"
done

device_description=$(pactl list sinks | grep -A 100 "Name: $next_sink_name" | grep "Description:" | awk '{$1=""; print $0}' | xargs)
notify-send "Audio Output Switched" "$device_description" -i audio-speakers -h string:transient:true