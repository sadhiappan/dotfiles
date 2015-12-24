#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

set -e

# Ask for Sudo upfront
sudo -v

# echo "[Info] Clear broken symlinks"
# Delete any broken symlinks in home
find -L ~ -type l -exec rm {} \;

sh scripts/linux.sh

stow vim -t ~
stow git -t ~
stow zsh -t ~
stow tmux -t ~
stow weechat -t ~
