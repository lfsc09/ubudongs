#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo -e "${ERROR}[Error] Unable to determine OS. /etc/os-release file not found.${NC}"
  echo -e "        ${WARNING}Installation stopped.${NC}"
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04 or higher
if [ "$ID" != "ubuntu" ] || [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]; then
  echo -e "${ERROR}[Error] OS requirement not met.${NC}"
  echo -e "        ${WARNING}You are currently running: $ID $VERSION_ID${NC}"
  echo -e "        ${WARNING}OS required: Ubuntu 24.04 or higher${NC}"
  echo -e "        ${WARNING}Installation stopped.${NC}"
  exit 1
fi

# Check if running on x86
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  echo -e "${ERROR}[Error] Unsupported architecture detected.${NC}"
  echo -e "        ${WARNING}Current architecture: $ARCH${NC}"
  echo -e "        ${WARNING}This installation is only supported on x86 architectures (x86_64 or i686).${NC}"
  echo -e "        ${WARNING}Installation stopped.${NC}"
  exit 1
fi
