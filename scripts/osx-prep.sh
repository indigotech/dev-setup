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

# Set Computer Name
echo -en "\033[33m"
echo "------------------------------"
echo "Setting Computer Name..."
echo -en "\033[0m"
read -p "Computer Name: " COMPUTER_NAME
sudo scutil --set ComputerName "$COMPUTER_NAME"
unset COMPUTER_NAME


# Disable Handoff
# From: https://jamfnation.jamfsoftware.com/discussion.html?id=12545
echo -en "\033[33m"
echo "------------------------------"
echo "Disabling Handoff..."
echo -en "\033[0m"
UUID=$(/usr/sbin/system_profiler SPHardwareDataType | grep "Hardware UUID" | cut -c22-57)
PREF_FILE="$HOME/Library/Preferences/ByHost/com.apple.coreservices.lsuseractivityd.${UUID}.plist"

defaults write $PREF_FILE ActivityAdvertisingAllowed -bool NO
defaults write $PREF_FILE ActivityReceivingAllowed -bool NO

unset UUID
unset PREF_FILE
