#!/bin/bash

print_header "Wallpaper cycle installation"

sudo cp $UBUDONGS_PATH/install/terminal/additional/wallpaper/cycle-wallpapers.run.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-wallpapers.run.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/cycle-wallpapers.run.sh

sudo cp $UBUDONGS_PATH/install/terminal/additional/wallpaper/adjust-background-resolution.run.sh $UBUDONGS_ADDITIONAL_TOOLS_DIR/adjust-background-resolution.run.sh
sudo chmod +x $UBUDONGS_ADDITIONAL_TOOLS_DIR/adjust-background-resolution.run.sh

log_skipline
log_success "Scripts installed"
print_footer
