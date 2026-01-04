#!/bin/bash

print_header "FiraCode fonts installation"

mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d FiraCodeFont
cp FiraCodeFont/*.ttf ~/.local/share/fonts
rm -rf FiraCode.zip FiraCodeFont

fc-cache
cd -

log_skipline
log_success "FiraCode fonts installed"
print_footer
