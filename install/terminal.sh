#!/bin/bash

print_header "Terminal tools and packages"
log_info "Starting to install terminal tools and packages..."

# Run terminal installers
for installer in $UBUDONGS_PATH/install/terminal/*.sh; do source $installer; done

# Add additional ubudongs tool scripts
export UBUDONGS_ADDITIONAL_TOOLS_DIR="/usr/local/bin/ubudongs"
sudo mkdir -p "$UBUDONGS_ADDITIONAL_TOOLS_DIR"
shopt -s globstar
for script in $UBUDONGS_PATH/install/terminal/additional/**/install.sh; do
  [ -f "$script" ] && source "$script"
done
shopt -u globstar

echo ""
log_success "Terminal tools installed"
