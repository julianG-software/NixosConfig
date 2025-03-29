#!/bin/bash

# Get argument from command line, default to #value1 if none provided
ARGUMENT="${1:-nixos}"


case "$ARGUMENT" in
        "nixos")
                sudo nixos-rebuild test --flake ~/.config/nixos/hosts/nixos/#nixos
            exit 0
        ;;
        *) echo default
            echo "please specify host"
            exit 2
        ;;
esac




