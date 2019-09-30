#!/usr/bin/env bash

# Install RVM
echo -en "\033[33m"
echo "------------------------------"
echo "Installing RVM..."
echo -en "\033[0m"
if [ ! -f $HOME/.rvm/scripts/rvm ]; then
  curl -sSL https://get.rvm.io | bash -s stable
else
  echo -e "\033[32mRVM already installed. \033[0m"
fi

# Load RVM
echo -en "\033[33m"
echo "------------------------------"
echo "Loading RVM..."
echo -en "\033[0m"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Install ruby
echo -en "\033[33m"
echo "------------------------------"
echo "Installing ruby..."
echo -en "\033[0m"
rvm install 2.4.5 --disable-binary
rvm use 2.4.5 --default

# No rdoc and no ri by default
echo -en "\033[33m"
echo "------------------------------"
echo "Configuring .gemrc file..."
echo -en "\033[0m"
if [ ! -f $HOME/.gemrc ]; then
  cat $HOME/.gemrc | grep "gem: --no-ri --no-rdoc" >/dev/null
  if [[ $? != 0 ]]; then
    echo "gem: --no-ri --no-rdoc" >> $HOME/.gemrc
  fi
else
  echo -e "\033[32m.gemrc file already configured. \033[0m"
fi

# Install rubygems
echo -en "\033[33m"
echo "------------------------------"
echo "Installing gems..."
echo -en "\033[0m"
gem install bundler --conservative
gem install cocoapods --conservative

# Configure bundler
echo -en "\033[33m"
echo "------------------------------"
echo "Configuring bundler..."
echo -en "\033[0m"
bundle config --global jobs 7
