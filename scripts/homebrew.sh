#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
echo -en "\033[33m"
echo "------------------------------"
echo "Installing Homebrew..."
echo -en "\033[0m"
if [ ! -f /usr/local/bin/brew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
else
  echo -e "\033[32mHombrew already installed. \033[0m"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Tap
brew tap homebrew/versions
brew tap caskroom/versions

# Install Zsh
brew install zsh
# We installed the new shell, now we have to activate it
echo -en "\033[33m"
echo "------------------------------"
echo "Setting zsh as default shell..."
echo -en "\033[0m"
ZSH_PATH="/usr/local/bin/zsh"
if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  cat /etc/shells | grep "$ZSH_PATH" >/dev/null
  if [[ $? != 0 ]]; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
  fi
  # Change to the new shell, prompts for password
  chsh -s $ZSH_PATH
else
  echo -e "\033[32mzsh already set as default shell. \033[0m"
fi
unset ZSH_PATH

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Heroku Toolbelt
brew install heroku-toolbelt

# Install git
brew install git
brew install git-extras

# Install, configure and run MongoDB
brew install mongodb
ln -sv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

# Install Cask
brew install caskroom/cask/brew-cask

# Core casks
brew cask install iterm2
brew cask install java
brew cask install xquartz

# Development tool casks
brew cask install sublime-text3
brew cask install atom
brew cask install virtualbox
brew cask install genymotion

# Misc casks
brew cask install slack
brew cask install google-chrome
brew cask install spectacle
brew cask install charles
brew cask install mongohub
brew cask install skitch

# Remove outdated versions from the cellar.
brew cleanup
