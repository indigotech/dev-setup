#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install pip if needed
if ! type pip >/dev/null 2>&1; then
  $HOME/scripts/pip.sh
fi

echo -en "\033[33m"
echo "------------------------------"
echo "Installing battleschool..."
echo -en "\033[0m"
# Install battleschool
if ! type battle >/dev/null 2>&1; then
  sudo pip install battleschool
else
  echo -e "\033[32mbattleschool already installed. \033[0m"
fi

# Run battleschool
echo -en "\033[33m"
echo "------------------------------"
echo "Installing playbooks..."
echo -en "\033[0m"

read -p "FTP user: " FTP_USER
read -s -p "FTP password: " FTP_PASSWORD
echo

battle -K -v -e FTP_USER=$FTP_USER -e FTP_PASSWORD=$FTP_PASSWORD

unset FTP_USER
unset FTP_PASSWORD
