#!/bin/bash

if ! command -v vim &> /dev/null; then
  print_header "Vim installation"

  sudo apt-get install -y vim
  # Make vim default editor
  sudo update-alternatives --set editor /usr/bin/vim.basic

  log_skipline
  log_success "Vim installed and set as default"
  print_footer
fi
