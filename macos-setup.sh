#!/bin/sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Some Apps I Like
brew install --cask adoptopenjdk8
brew install --cask alfred
brew install --cask docker
brew install --cask google-chrome
brew install --cask slack
brew install --cask spotify
brew install --cask iterm2
brew install --cask visual-studio-code

# Install Other Tools
brew install aws-iam-authenticator
brew install bash-completion
brew install brotli
brew install c-ares
brew install ca-certificates
brew install cmake
brew install eksctl
brew install gcc
brew install gdbm
brew install gettext
brew install giflib
brew install git
brew install gmp
brew install go
brew install icu4c
brew install isl
brew install jpeg
brew install jpeg-turbo
brew install jq
brew install k9s
brew install krb5
brew install kubernetes-cli
brew install nasm
brew install neovim
brew install postgresql@14
brew install ripgrep
brew install tree-sitter
brew install watch
brew install yarn

# Install Work Tools
brew install argo
brew install pulumi

# Clean up
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
