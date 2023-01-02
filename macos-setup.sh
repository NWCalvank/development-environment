#!/bin/sh
chsh -s /bin/zsh # Change to /bin/bash if using bash

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

# Set up Bash Shell
make sync-bash

# Set up Vim
make sync-vim

# Set up Neovim
make sync-neovim

# Set up zsh Shell
make sync-zsh

# Set up Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.zshrc # Change to ~/.bash_profile if using bash
nvm install node  # install latest version
nvm install --lts # install LTS version

# Set Up Local git Config
git config --global user.name "Nathan Calvank"
git config --global core.editor "nvim"
nvim ~/.gitconfig +PackerSync
