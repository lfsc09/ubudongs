#!/bin/bash

# Display system information in the terminal
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update -y
sudo apt install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Ubudongs fastfetch config
  mkdir -p ~/.config/fastfetch
  cp $UBUDONGS_PATH/configs/fastfetch/fastfetch.jsonc ~/.config/fastfetch/config.jsonc

  # Copy Ubudongs ASCII text file for fastfetch logo
  cp $UBUDONGS_PATH/ascii-art ~/.config/fastfetch/ubudongs-ascii
fi
