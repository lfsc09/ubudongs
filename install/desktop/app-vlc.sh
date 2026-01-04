#!/bin/bash

if ! command -v vlc &> /dev/null; then
  print_header "Vlc installation"
  
  sudo apt install -y vlc
  
  log_skipline
  log_success "Vlc installed"
  print_footer
fi
