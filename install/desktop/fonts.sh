#!/bin/bash

print_header "FiraCode fonts installation"

mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d FiraCodeFont
cp FiraCodeFont/*.ttf ~/.local/share/fonts
rm -rf FiraCode.zip FiraCodeFont

# Get the latest version tag of JetBrains Mono from GitHub API
JETBRAINS_VERSION=$(curl -s https://api.github.com/repos/JetBrains/JetBrainsMono/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v${JETBRAINS_VERSION}/JetBrainsMono-${JETBRAINS_VERSION}.zip
unzip JetBrainsMono-${JETBRAINS_VERSION}.zip -d JetBrainsMonoFont
cp JetBrainsMonoFont/*.ttf ~/.local/share/fonts
rm -rf JetBrainsMono-${JETBRAINS_VERSION}.zip JetBrainsMonoFont

fc-cache
cd -

log_skipline
log_success "FiraCode fonts installed"
log_success "JetBrains Mono fonts installed"
print_footer
