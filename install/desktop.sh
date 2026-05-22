#!/bin/bash

print_header "Terminal tools and packages"
log_info "Starting to install desktop tools and tweaks..."

# Run desktop installers
for installer in $UBUDONGS_PATH/install/desktop/*.sh; do source $installer; done

log_skipline
log_success "Desktop tools and tweaks installed"
