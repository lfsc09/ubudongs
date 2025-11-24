#!/bin/bash

# Clean up self after reboot
(crontab -l 2>/dev/null; echo "@reboot rm -rf ~/.local/share/ubudongs") | crontab -
