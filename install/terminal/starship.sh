#!/bin/bash

curl -sS https://starship.rs/install.sh | sh -s -- -y
cp ~/.local/share/ubudongs/configs/starship/starship.toml ~/.config/starship.toml
