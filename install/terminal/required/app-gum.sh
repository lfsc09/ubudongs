#!/bin/bash

# Gum is used for the Ubudongs commands for tailoring Ubudongs after the initial install
cd /tmp
gum_version="0.17.0"
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${gum_version}/gum_${gum_version}_amd64.deb"
sudo apt-get install -y --allow-downgrades ./gum.deb
rm gum.deb
cd -
