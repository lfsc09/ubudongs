#!/bin/bash
# Virtualbox allows you to run VMs for other flavors of Linux or even Windows
# See https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
# for a guide on how to run Ubuntu inside it.

if ! command -v virtualbox &> /dev/null; then
  print_header "Virtualbox installation"

  sudo apt install -y virtualbox virtualbox-ext-pack
  sudo usermod -aG vboxusers ${USER}

  echo ""
  log_success "Virtualbox installed"
  print_footer
fi
