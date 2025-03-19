#!/bin/bash

# Get argument from command line, default to #value1 if none provided
ARGUMENT="${1:-#nixos}"

sudo nixos-rebuild switch --flake ~/.config/nixos"$ARGUMENT"
