#!/bin/bash

if ! command -v starship &> /dev/null; then
  print_header "Starship installation"

  curl -sS https://starship.rs/install.sh | sh -s -- -y
  cp $UBUDONGS_PATH/configs/starship/starship.toml ~/.config/starship.toml

  echo ""
  log_success "Starship installed"
  print_footer
fi
