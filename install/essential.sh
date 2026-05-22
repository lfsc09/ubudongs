#!/bin/bash

print_header "Essential tools and packages"
log_info "Starting to install essential tools and packages..."

# Run essential installers
source $UBUDONGS_PATH/install/essential/shell.sh
source $UBUDONGS_PATH/install/essential/flatpak.sh

log_skipline
log_success "Essential tools and packages installed"