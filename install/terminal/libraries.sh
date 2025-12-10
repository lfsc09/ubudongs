#!/bin/bash

print_header "Libraries installation"

sudo apt install -y \
  gnupg gpg-agent uidmap \
  pulseaudio-utils libnotify-bin \
  build-essential pkg-config autoconf bison clang rustc pipx \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
  libvips ffmpeg imagemagick libmagickwand-dev mupdf mupdf-tools

echo ""
log_success "Libraries installed"
print_footer
