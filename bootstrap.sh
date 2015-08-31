#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

set -e

# Ask for Sudo upfront
sudo -v

CFG_DIRECTORY="$HOME/.dotfiles"

# Modify the PATH
export PATH=/usr/local/bin:$PATH

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
    echo "Info   | Install   | xcode"
    xcode-select --install
fi

# Delete any broken symlinks in home
find -L ~ -type l -exec rm {} \;

sh scripts/brew.sh
sh scripts/osx.sh

stow vim -t ~
stow git -t ~
stow zsh -t ~
