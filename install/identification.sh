#!/bin/bash

echo -e "${BLUE}[Action] Enter identification for git...${NC}"
SYSTEM_NAME=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)
export UBUDONGS_USER_NAME=$(gum input --placeholder "Enter full name" --value "$SYSTEM_NAME" --prompt "Name> ")
export UBUDONGS_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
