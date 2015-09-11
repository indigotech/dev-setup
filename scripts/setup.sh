#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "Syncing the dev-setup repo to your local machine."
echo "------------------------------"
echo -en "\033[0m"
cd $HOME && curl -#L https://github.com/indigotech/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE,.gitignore}

cd $HOME/scripts

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "Preparing OSX"
echo "------------------------------"
echo -en "\033[0m"
if ! ./osx-prep.sh; then
  # Command line tools was not installed
  # It needs to stop
  exit 1
fi

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "Battleschool"
echo "------------------------------"
echo -en "\033[0m"
./battleschool.sh

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "Homebrew"
echo "------------------------------"
echo -en "\033[0m"
./homebrew.sh

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "RVM, Ruby and Rubygems"
echo "------------------------------"
echo -en "\033[0m"
./rvm.sh

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "NVM and Node JS"
echo "------------------------------"
echo -en "\033[0m"
./nvm.sh

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "iOS developer"
echo "------------------------------"
echo -en "\033[0m"
./ios-developer.sh

echo -e "\033[1m\033[33m"
echo "------------------------------"
echo "Oh My Zsh"
echo "------------------------------"
echo -en "\033[0m"
./oh-my-zsh.sh

echo -e "\033[1m\033[32m"
echo "------------------------------"
echo "Setup complete, restart your computer to ensure all updates take effect"
echo "------------------------------"
echo -en "\033[0m"
