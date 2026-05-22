#!/bin/bash

if ! command -v gimp &> /dev/null; then
  print_header "Gimp installation"
  
  sudo apt install -y gimp

  log_skipline
  log_success "Gimp installed"
  print_footer
fi
