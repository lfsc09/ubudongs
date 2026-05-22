#!/bin/bash
# Browse the web with the most popular browser. See https://www.google.com/chrome/

if ! command -v google-chrome &> /dev/null; then
  print_header "Chrome installation"

  cd /tmp
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install -y ./google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
  xdg-settings set default-web-browser google-chrome.desktop
  cd -

  log_skipline
  log_success "Chrome installed"
  print_footer
fi
