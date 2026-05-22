#!/bin/bash

if ! command -v php &> /dev/null; then
  print_header "PHP installation"

  sudo apt install -y php

  log_skipline
  log_success "PHP installed"
  print_footer
fi
