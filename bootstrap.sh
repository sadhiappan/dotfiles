#!/bin/bash

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

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Download and install git
if [[ ! -x /usr/local/bin/git ]]; then
    echo "Info   | Install   | git"
    brew install git
fi

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    echo "Info  | Install   | ansible"
    brew install ansible
fi

# Clone down dotfiles
if [[ ! -d $CFG_DIRECTORY ]]; then
    git clone https://github.com/mmcdole/dotfiles $CFG_DIRECTORY 
fi

ansible-playbook -i $CFG_DIRECTORY/ansible/inventory $CFG_DIRECTORY/ansible/main.yml
