#!/bin/bash

# Run desktop installers
for installer in $UBUDONGS_PATH/install/desktop/*.sh; do source $installer; done
