#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

set -e

# Ask for Sudo upfront
sudo -v

# Modify the PATH
export PATH=/usr/local/bin:$PATH

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
    echo "[Info] Install command line tools"
    xcode-select --install
fi

# echo "[Info] Clear broken symlinks"
# Delete any broken symlinks in home
find -L ~ -type l -exec rm {} \;

sh scripts/brew.sh
sh scripts/osx.sh

stow vim -t ~
stow git -t ~
stow zsh -t ~
stow tmux -t ~
stow weechat -t ~
