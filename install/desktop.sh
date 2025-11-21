#!/bin/bash

# Run desktop installers
for installer in ~/.local/share/ubudongs/install/desktop/*.sh; do source $installer; done
