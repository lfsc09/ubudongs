#!/bin/bash

if [[ -v UBUDONGS_SELECTED_OPTIONAL_APPS ]]; then
	apps=$UBUDONGS_SELECTED_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$UBUDONGS_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
