#!/bin/bash

if ! command -v vlc &> /dev/null; then
  print_header "Vlc installation"
  
  sudo apt install -y vlc
  
  echo ""
  log_success "Vlc installed"
  print_footer
fi
