#!/bin/bash -e

which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

taps=(
  homebrew/binary
  caskroom/cask
)

formulae=(
  vim --override-system-vi
  stow
  ssh-copy-id
  brew-cask
  git
  go
  tintin
  ranger
  tmux
  cmake
  httpie
  curl
  python
  fzf
  coreutils
  nmap
  tree
  hub
  binutils
  wget
  cloc
  reattach-to-user-namespace
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
  citrix-receiver
  transmission
  vlc
  openemu
  keepingyouawake
  java
  steam
  spotify
  calibre
  licecap
  qlcolorcode
  qlmarkdown
  quicklook-csv
  quicklook-json
  virtualbox
)

#if ! brew doctor; then
#  echo "
#\`brew doctor\` failed. Please resolve issues before continuing.
#  "
#  exit 1
#fi

for tap in "${taps[@]}"; do
  brew tap $tap
done

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done

for cask in "${casks[@]}"; do
  brew cask install $cask
done
