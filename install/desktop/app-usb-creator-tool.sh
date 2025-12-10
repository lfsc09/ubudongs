#!/bin/bash

if ! command -v usb-creator-gtk &> /dev/null; then
  print_header "Usb Creator Gtk isntallation"

  sudo apt install -y usb-creator-gtk

  echo ""
  log_success "Usb creator gtk installed"
  print_footer
fi
