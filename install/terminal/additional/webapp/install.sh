#!/bin/bash

print_header "Webapp script installation"

sudo cp $UBUDONGS_PATH/install/terminal/additional/webapp/webapp-create.run.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/webapp-create.run.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/webapp-create.run.sh
sudo ln -sf $UBUDONGS_ADDITIONAL_TOOLS_DIR/webapp-create.run.sh /usr/local/bin/webapp-create

log_skipline
log_success "Script installed"
print_footer
