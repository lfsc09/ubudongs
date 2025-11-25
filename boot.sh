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
OK='\033[0;32m' # Green
INFO='\033[0;35m' # Purple
WARNING='\033[1;33m' # Yellow
ERROR='\033[0;31m' # Red
NC='\033[0m' # No Color
export OK INFO WARNING ERROR NC

echo -e "$ascii_art"
echo -e "${WARNING}=> Ubudongs is for fresh Ubuntu 24.04+ installations only!${NC}"
echo -e "${INFO}\n[Info] Begin installation (or abort with ctrl+c)...${NC}"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo -e "${INFO}[Info] Cloning Ubudongs...${NC}"
rm -rf ~/.local/share/ubudongs
git clone https://github.com/lfsc09/ubudongs.git ~/.local/share/ubudongs >/dev/null

echo -e "${WARNING}=> $(cat ~/.local/share/ubudongs/version)${NC}"
echo -e "${INFO}[Info] Installation starting...${NC}"
source ~/.local/share/ubudongs/install.sh
