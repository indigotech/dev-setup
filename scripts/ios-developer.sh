#!/usr/bin/env bash

read -p "FTP user: " ftp_user
read -s -p "FTP password: " ftp_password
echo
read -s -p "taqtile-developer-keys.p12 password: " ios_key_password
echo

# Import iOS developer keys
echo -en "\033[33m"
echo "------------------------------"
echo "Importing iOS developer keys..."
echo -en "\033[0m"
KEY_FILE=$HOME/taqtile-developer-keys.p12
curl -u $ftp_user:$ftp_password -o $KEY_FILE ftp://10.22.11.80/Dev/Keys/taqtile-developer-keys.p12 &&
if ! security import $KEY_FILE -k ~/Library/Keychains/login.keychain -P $ios_key_password; then
  echo -e "\033[31mError importing developer keys"
fi

if [ ! -f $KEY_FILE ]; then
  rm $KEY_FILE
fi
unset KEY_FILE
