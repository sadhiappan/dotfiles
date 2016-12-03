#!/bin/bash -e

packages=(
	vim
  fzf
  stow
  git
  golang
  tintin
  irssi
  ranger
  tmux
  cmake
  httpie
  curl
  python
  coreutils
  nmap
  tree
  hub
  selecta
  wget
  cloc
  mitmproxy
  youtube-dl
  ansible
  weechat --with-perl --with-python
)

casks=(
  seil
  iterm2
  hipchat
  sequel-pro
  google-chrome
  alfred
  sublime-text
  dropbox
  1password
)

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
