#!/bin/bash
set -e

# Define some colors for the rest of the installation
OK='\033[0;32m' # Green
INFO='\033[0;35m' # Purple
WARNING='\033[1;33m' # Yellow
ERROR='\033[0;31m' # Red
NC='\033[0m' # No Color
export OK INFO WARNING ERROR NC
export UBUDONGS_PATH="$HOME/.local/share/ubudongs"

echo -e "${OK}$(cat ascii-art)${NC}"
echo -e "${WARNING}=> Ubudongs is for fresh Ubuntu 24.04+ installations only!${NC}"
echo -e "${INFO}\n[Info] Begin installation (or abort with ctrl+c)...${NC}"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo -e "${INFO}[Info] Cloning Ubudongs...${NC}"
rm -rf $UBUDONGS_PATH
git clone https://github.com/lfsc09/ubudongs.git $UBUDONGS_PATH >/dev/null

echo -e "${WARNING}=> $(cat $UBUDONGS_PATH/version)${NC}"
echo -e "${INFO}[Info] Installation starting...${NC}"

source $UBUDONGS_PATH/install.sh
