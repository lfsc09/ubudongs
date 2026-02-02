#!/bin/bash

if ! command -v jetbrains-toolbox &> /dev/null; then
  print_header "JetBrains Toolbox installation"

  sudo apt install -y libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin tar dbus-user-session

  jetbrains_toolbox_version="3.2.0.65851"
  cd /tmp
  wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-${jetbrains_toolbox_version}.tar.gz
  sudo tar -xzf jetbrains-toolbox-${jetbrains_toolbox_version}.tar.gz -C /opt/
  sudo ln -s /opt/jetbrains-toolbox-${jetbrains_toolbox_version}/bin/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
  rm -rf jetbrains-toolbox-${jetbrains_toolbox_version}*.tar.gz
  cd -

  log_skipline
  log_success "JetBrains Toolbox installed"
  print_footer
fi
