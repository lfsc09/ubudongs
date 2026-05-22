#!/bin/bash

print_header "Fonts installation"

mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d FiraCodeFont
find FiraCodeFont -type f -name "*.ttf" -exec cp {} ~/.local/share/fonts \;
rm -rf FiraCode.zip FiraCodeFont

# Get the latest version tag of JetBrains Mono from GitHub API
jetbrains_version=$(curl -s https://api.github.com/repos/JetBrains/JetBrainsMono/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v${jetbrains_version}/JetBrainsMono-${jetbrains_version}.zip
unzip JetBrainsMono-${jetbrains_version}.zip -d JetBrainsMonoFont
find JetBrainsMonoFont -type f -name "*.ttf" -exec cp {} ~/.local/share/fonts \;
rm -rf JetBrainsMono-${jetbrains_version}.zip JetBrainsMonoFont
fc-cache
cd -

log_skipline
log_success "FiraCode fonts installed"
log_success "JetBrains Mono fonts installed"
print_footer
