#!/bin/bash

if [ ! -f /etc/os-release ]; then
  log_skipline
  log_error "Unable to determine OS. /etc/os-release file not found." 
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 26.04 version exactly
if [ "$ID" != "ubuntu" ] || [ "$VERSION_ID" != "26.04" ]; then
  log_skipline
  log_error "OS requirement not met."
  log_error "You are currently running: $ID $VERSION_ID"
  log_error "OS required: Ubuntu 26.04"
  exit 1
fi

# Check if running on x86
arch=$(uname -m)
if [ "$arch" != "x86_64" ] && [ "$arch" != "i686" ]; then
  log_skipline
  log_error "Unsupported architecture detected."
  log_error "Current architecture: $arch"
  log_error "This installation is only supported on x86 architectures (x86_64 or i686)"
  exit 1
fi
