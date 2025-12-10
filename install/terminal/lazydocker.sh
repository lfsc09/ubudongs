#!/bin/bash

if ! command -v lazydocker &> /dev/null; then
  print_header "Lazydocker installation"

  cd /tmp
  lazydocker_version=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${lazydocker_version}_Linux_x86_64.tar.gz"
  tar -xf lazydocker.tar.gz lazydocker
  sudo install lazydocker /usr/local/bin
  rm lazydocker.tar.gz lazydocker
  cd -

  echo ""
  log_success "Lazydocker installed"
  print_footer
fi
