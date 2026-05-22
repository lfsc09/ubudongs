#!/bin/bash

print_header "Webapp script installation"

sudo cp $UBUDONGS_PATH/install/terminal/additional/webapp/webapp-manager.run.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/webapp-manager.run.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/webapp-manager.run.sh
sudo ln -sf $UBUDONGS_ADDITIONAL_TOOLS_DIR/webapp-manager.run.sh /usr/local/bin/webapp-manager

log_skipline
log_success "Script installed"
print_footer
