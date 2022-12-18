#!/bin/sh
chsh -s /bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Some Apps I Like
brew cask install alfred
brew cask install docker
brew cask install google-chrome
brew cask install slack
brew cask install spotify

# Install Other Tools
brew install bash-completion
brew install git
brew install go
brew install jq
brew install nasm
brew install neovim
brew install python
brew install python3
brew install ripgrep
brew install watch
brew cleanup

# Set up Terminal
cp .bash_alias ~/.bash_alias
cp .bash_profile ~/.bash_profile
cp .bash_prompt ~/.bash_prompt
source ~/.bash_profile

# Set up Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.bash_profile
nvm install node  # install latest version
nvm install --lts # install LTS version

# Set Up Local git Config
git config --global user.name "Nathan Calvank"
git config --global core.editor "nvim"
nvim ~/.gitconfig # Opens file, ready to be updated with email

# Set Up neovim
cp -r nvim ~/.config/
