#!/bin/bash
set -e

ascii_art='
  _   _ _               _                        
 | | | | |__  _   _  __| | ___  _ __   __ _ ___ 
 | | | | '\''_ \| | | |/ _` |/ _ \| '\''_ \ / _` / __|
 | |_| | |_) | |_| | (_| | (_) | | | | (_| \__ \
  \___/|_.__/ \__,_|\__,_|\___/|_| |_|\__, |___/
                                      |___/     
'

# Define some colors for the rest of the installation
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
export GREEN YELLOW RED NC

echo -e "$ascii_art"
echo -e "${YELLOW}=> Ubudongs is for fresh Ubuntu 24.04+ installations only!${NC}"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Ubudongs..."
rm -rf ~/.local/share/ubudongs
git clone https://github.com/lfsc09/ubudongs.git ~/.local/share/ubudongs >/dev/null

echo "Installation starting..."
source ~/.local/share/ubudongs/install.sh
