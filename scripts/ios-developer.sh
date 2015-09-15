#!/usr/bin/env bash

# Import iOS developer keys
echo -en "\033[33m"
echo "------------------------------"
echo "Importing iOS developer keys..."
echo -en "\033[0m"

read -p "FTP user: " FTP_USER
read -s -p "FTP password: " FTP_PASSWORD
echo
read -s -p "taqtile-developer-keys.p12 password: " IOS_KEY_PASSWORD
echo

KEY_FILE="$HOME/taqtile-developer-keys.p12"
curl -u $FTP_USER:$FTP_PASSWORD -o $KEY_FILE ftp://10.22.11.80/Dev/Keys/taqtile-developer-keys.p12 &&
if ! security import $KEY_FILE -k ~/Library/Keychains/login.keychain -P $IOS_KEY_PASSWORD; then
  echo -e "\033[31mError importing developer keys"
fi

if [ -f $KEY_FILE ]; then
  rm $KEY_FILE
fi

unset FTP_USER
unset FTP_PASSWORD
unset IOS_KEY_PASSWORD
unset KEY_FILE
