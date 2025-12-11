#!/bin/bash
set -e

ascii_art='
  _   _ _               _                        
 | | | | |__  _   _  __| | ___  _ __   __   ___ 
 | | | |  _ \| | | |/ _` |/ _ \|  _ \ / _ \/ __|
 | |_| | |_) | |_| | (_| | (_) | | | | (_| \__ \
  \___/|____/ \____|\____|\___/|_| |_|\__, |___/
                                      |___/     
'

# Script colors
OK='\033[1;32m' # Green
ACTION='\033[1;34m' # Blue
WARNING='\033[1;33m' # Yellow
ERROR='\033[1;31m' # Red
NC='\033[0m' # No Color

# Script functions
log_info() {
  echo -e "[INFO] $1"
}

log_action() {
  echo -e "${ACTION}[ACTION] $1${NC}"
}

log_success() {
  echo -e "${OK}[OK] $1${NC}"
}

log_warn() {
  echo -e "${WARNING}[WARN] $1${NC}"
}

log_error() {
  echo -e "${ERROR}[ERROR] $1${NC}"
}

print_header() {
  echo ""
  echo "========================================="
  echo "$1"
  echo "========================================="
}

print_footer() {
  echo "========================================="
  echo ""
}

export -f log_info log_action log_success log_warn log_error print_header print_footer
export OK ACTION WARNING ERROR NC
export UBUDONGS_PATH="$HOME/.local/share/ubudongs"

echo -e "$ascii_art"
log_warn "Ubudongs is for fresh Ubuntu 24.04+ installations only!"
log_warn "Begin installation (or abort with ctrl+c)..."

echo ""
log_info "Updating system..."
sudo apt-get update -y >/dev/null
sudo apt-get upgrade -y >/dev/null
sudo apt-get install -y wget curl git unzip gpg >/dev/null

echo ""
log_info "Cloning Ubudongs..."
rm -rf $UBUDONGS_PATH
git clone https://github.com/lfsc09/ubudongs.git $UBUDONGS_PATH >/dev/null

echo ""
log_warn "Ubudongs installer $(cat $UBUDONGS_PATH/version)"
log_info "Installation starting..."

source $UBUDONGS_PATH/install.sh
