#!/bin/bash

curl -sS https://starship.rs/install.sh | sh -s -- -y
cp $UBUDONGS_PATH/configs/starship/starship.toml ~/.config/starship.toml
