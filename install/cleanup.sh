#!/bin/bash

print_header "Terminal tools and packages"
log_info "Starting to install terminal tools and packages..."

for cleaner in $UBUDONGS_PATH/cleanup/*.sh; do source $cleaner; done

echo ""
log_success "Cleanup completed"
