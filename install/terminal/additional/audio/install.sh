#!/bin/bash

print_header "Cycle output devices installation"

sudo cp $UBUDONGS_PATH/install/terminal/additional/audio/cycle-output-devices.run.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.run.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.run.sh
sudo ln -sf $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.run.sh /usr/local/bin/cycle-output-devices

sudo cp $UBUDONGS_PATH/install/terminal/additional/audio/cycle-output-devices.setup.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.setup.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.setup.sh
sudo ln -sf $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.setup.sh /usr/local/bin/cycle-output-devices.setup
log_skipline
log_success "Scripts installed"
print_footer
