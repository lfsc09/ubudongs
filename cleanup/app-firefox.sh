#!/bin/bash

# Try removing from apt first
sudo apt-get remove --purge -y firefox

# Then try removing from snap
sudo snap remove firefox
