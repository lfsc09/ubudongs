#!/bin/bash

if ! command -v gimp &> /dev/null; then
  print_header "Gimp installation"
  
  flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref

  log_skipline
  log_success "Gimp installed"
  print_footer
fi
