#!/bin/bash

if ! command -v gnome-tweak-tool &> /dev/null; then
  print_header "Gnome tweak tool installation"

  sudo apt install -y gnome-tweak-tool

  echo ""
  log_success "Gnome tweak tool installed"
  print_footer
fi
