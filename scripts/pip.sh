#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install pip
echo -en "\033[33m"
echo "------------------------------"
echo "Installing pip..."
echo -en "\033[0m"
if ! type pip >/dev/null 2>&1; then
  sudo easy_install pip
else
  echo -e "\033[32mpip already installed. \033[0m"
fi
