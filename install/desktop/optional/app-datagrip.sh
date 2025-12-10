#!/bin/bash

if ! command -v datagrip &> /dev/null; then
  print_header "Datagrip installation"

  sudo snap install datagrip --classic

  echo ""
  log_success "Datagrip installed"
  print_footer
fi
