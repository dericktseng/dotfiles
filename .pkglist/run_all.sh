#!/usr/bin/env bash

# disallow if running as root
if [ "$EUID" -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

/bin/bash ./install.sh
/bin/bash ./finalize.sh
/bin/bash ./fonts.sh
