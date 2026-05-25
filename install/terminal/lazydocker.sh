#!/bin/bash

if ! command -v lazydocker &> /dev/null; then
  print_header "Lazydocker installation"

  curl -sS https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | sh -s -- -y

  log_skipline
  log_success "Lazydocker installed"
  print_footer
fi
