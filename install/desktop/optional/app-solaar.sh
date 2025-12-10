#!/bin/bash

if ! command -v solaar &> /dev/null; then
  print_header "Solaar installation"

  sudo apt install -y solaar

  echo ""
  log_success "Solaar installed"
  print_footer
fi
