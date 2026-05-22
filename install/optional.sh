#!/bin/bash

print_header "Optional tools"

if [[ -v UBUDONGS_SELECTED_OPTIONAL_APPS ]]; then
	log_info "Starting to install optional tools..."
	apps=$UBUDONGS_SELECTED_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$UBUDONGS_PATH/install/optional/${app,,}.sh"
		done
	fi

	log_skipline
	log_success "Optional tools installed"
else
	log_info "No optional tools selected, skipping..."
fi
