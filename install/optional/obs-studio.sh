#!/bin/bash
# OBS Studio is a screen recording application that allows you to capture both display and webcam in the same recording

if ! command -v obs-studio &> /dev/null; then
  print_header "OBS Studio installation"

  sudo apt install -y obs-studio

  log_skipline
  log_success "OBS Studio installed"
  print_footer
fi
