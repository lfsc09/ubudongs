#!/bin/bash

print_header "Configuring gnome shell"

# Configure the bash shell using Ubudongs defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp $UBUDONGS_PATH/configs/bashrc ~/.bashrc
source ~/.bashrc

# Configure the inputrc using Ubudongs defaults
[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
cp $UBUDONGS_PATH/configs/inputrc ~/.inputrc

# Copy bash function definitions
[ -f ~/.bash_functions ] && mv ~/.bash_functions ~/.bash_functions.bak
cp $UBUDONGS_PATH/configs/bash_functions ~/.bash_functions

# Copy bash aliases
[ -f ~/.bash_aliases ] && mv ~/.bash_aliases ~/.bash_aliases.bak
cp $UBUDONGS_PATH/configs/bash_aliases ~/.bash_aliases

log_skipline
log_success "Gnome shell configured"
print_footer
