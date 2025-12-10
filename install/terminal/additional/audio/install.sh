#!/bin/bash

print_header "Cycle output devices installation"

sudo cp $UBUDONGS_PATH/install/terminal/additional/audio/cycle-output-devices.run.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.run.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.run.sh

sudo cp $UBUDONGS_PATH/install/terminal/additional/audio/cycle-output-devices.setup.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.setup.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-output-devices.setup.sh

echo ""
log_success "Scripts installed"
print_footer
