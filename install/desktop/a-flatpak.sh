#!/bin/bash

if ! command -v flatpak &> /dev/null; then
  print_header "Flatpak installation"
  
  sudo apt install -y flatpak
  sudo apt install -y gnome-software-plugin-flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

  log_skipline
  log_success "Flatpak installed"
  print_footer
fi
