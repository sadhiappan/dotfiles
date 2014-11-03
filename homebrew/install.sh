#!/bin/bash -e

which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

taps=(
  homebrew/binary
  caskroom/cask
)

formulae=(
  brew-cask
  git
#  rust
  go
  tintin
  tmux
  cmake
  curl
#  rtorrent
  nmap
  tree
  hub
  selecta
  wget
  vim --override-system-vi
)

casks=(
  iterm2
  hipchat
  google-chrome
  alfred
  sublime-text
  dropbox
  onepassword
  citrix-receiver
  transmission
  vlc
  openemu
  caffeine
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

if ! brew doctor; then
  echo "
\`brew doctor\` failed. Please resolve issues before continuing.
  "
  exit 1
fi

for tap in "${taps[@]}"; do
  brew tap $tap
done

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done

for cask in "${casks[@]}"; do
  brew cask install $cask
done
