#!/bin/bash
# Display system information in the terminal

if ! command -v fastfetch &> /dev/null; then
  print_header "Fastfetch installation"

  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update -y
  sudo apt install -y fastfetch

  # Use Ubudongs fastfetch config
  mkdir -p ~/.config/fastfetch
  cp $UBUDONGS_PATH/configs/fastfetch/fastfetch.jsonc ~/.config/fastfetch/config.jsonc

  # Copy Ubudongs ASCII text file for fastfetch logo
  cp $UBUDONGS_PATH/ascii-art ~/.config/fastfetch/ubudongs-ascii

  echo ""
  log_success "Fastfetch installed"
  print_footer
fi
