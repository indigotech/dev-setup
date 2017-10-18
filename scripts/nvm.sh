#!/usr/bin/env bash

# Install NVM
echo -en "\033[33m"
echo "------------------------------"
echo "Installing NVM..."
echo -en "\033[0m"
if [ ! -f $HOME/.nvm/nvm.sh ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
else
  echo -e "\033[32mNVM already installed. \033[0m"
fi

# Load NVM
echo -en "\033[33m"
echo "------------------------------"
echo "Loading NVM..."
echo -en "\033[0m"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install node
echo -en "\033[33m"
echo "------------------------------"
echo "Installing node..."
echo -en "\033[0m"
nvm install 6.5.0
nvm alias default 6.5.0
