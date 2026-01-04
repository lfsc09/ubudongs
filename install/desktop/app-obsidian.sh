#!/bin/bash

if ! command -v obsidian &> /dev/null; then
  print_header "Obsidian installation"

  cd /tmp
  OBSIDIAN_VERSION=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
  wget -O obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/latest/download/obsidian_${OBSIDIAN_VERSION}_amd64.deb"
  sudo apt install -y ./obsidian.deb
  rm obsidian.deb
  cd -

  log_skipline
  log_success "Obsidian installed"
  print_footer
fi
