#!/bin/sh
chsh -s /bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Some Apps I Like
brew install --cask alfred
brew install --cask docker
brew install --cask google-chrome
brew install --cask slack
brew install --cask spotify
brew install --cask iterm2

# Install Other Tools
brew install bash-completion
brew install git
brew install go
brew install jq
brew install nasm
brew install neovim
brew install ripgrep
brew install watch
brew cleanup

# Set up Bash Terminal
make sync-bash

# Set up Vim
make sync-vim

# Set up Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.bash_profile
nvm install node  # install latest version
nvm install --lts # install LTS version

# Set Up Neovim
make sync-neovim

# Set Up Local git Config
git config --global user.name "Nathan Calvank"
git config --global core.editor "nvim"
nvim ~/.gitconfig +PackerSync
