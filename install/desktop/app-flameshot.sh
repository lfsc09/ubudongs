#!/bin/bash
# Flameshot is a nice step-up over the default Gnome screenshot tool

if ! command -v flameshot &> /dev/null; then
  print_header "Flame installation"

  sudo apt install -y flameshot

  log_skipline
  log_success "Flame installed"
  print_footer
fi
