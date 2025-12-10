#!/bin/bash
# Make video calls using https://zoom.us/

if ! command -v zoom &> /dev/null; then
  print_header "Zoom installation"
  
  cd /tmp
  wget https://zoom.us/client/latest/zoom_amd64.deb
  sudo apt install -y ./zoom_amd64.deb
  rm zoom_amd64.deb
  cd -

  echo ""
  log_success "Zoom installed"
  print_footer
fi
