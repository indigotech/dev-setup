#!/usr/bin/env bash

# Update OSX
echo -en "\033[33m"
echo "------------------------------"
echo "Updating OSX.  If this requires a restart, run the script again."
echo -en "\033[0m"
# sudo softwareupdate -iva

# Install command line tools
echo -en "\033[33m"
echo "------------------------------"
echo "Installing Command line tools..."
echo -en "\033[0m"
if ! xcode-select -p >/dev/null 2>&1; then
  echo -e "\033[33mPlease re-run this script after the installation is complete. \033[0m"
  xcode-select --install
  exit 1
else
  echo -e "\033[32mCommand line tools already installed. \033[0m"
fi
