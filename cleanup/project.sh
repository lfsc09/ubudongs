#!/bin/bash

# Wait 10 seconds after boot to ensure system is ready, then delete the Ubudongs directory
(crontab -l 2>/dev/null; echo "@reboot sleep 10 && rm -rf \"$UBUDONGS_PATH\"") | crontab -
