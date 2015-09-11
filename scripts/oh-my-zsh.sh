#!/usr/bin/env bash

# Install Oh My Zsh
echo -en "\033[33m"
echo "------------------------------"
echo "Installing Oh My Zsh..."
echo -en "\033[0m"
if [ ! -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Configure Alt+Left Alt+Right inputs
  echo "" >> $HOME/.zshrc
  echo "# Configure Alt+Left Alt+Right inputs" >> $HOME/.zshrc
  echo 'bindkey "\e\e[D" backward-word' >> $HOME/.zshrc
  echo 'bindkey "\e\e[C" forward-word' >> $HOME/.zshrc
else
  echo -e "\033[32mOh My Zsh already installed. \033[0m"
fi
