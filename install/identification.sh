#!/bin/bash

echo -e "${INFO}[Action] Enter identification for git...${NC}"
system_name=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)
export UBUDONGS_USER_NAME=$(gum input --placeholder "Enter full name" --value "$system_name" --prompt "Name> ")
export UBUDONGS_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
