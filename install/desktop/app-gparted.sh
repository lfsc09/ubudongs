#!/bin/bash

if ! command -v gparted &> /dev/null; then
  print_header "Gparted installation"
  
  sudo apt install -y gparted
  
  log_skipline
  log_success "Gparted installed"
  print_footer
fi