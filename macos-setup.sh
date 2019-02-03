#!/bin/sh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install my favourite apps
brew cask install alfred
brew cask install docker
brew cask install google-chrome
brew cask install node
brew cask install slack
brew cask install spotify
brew cask install sublime-text
# install other tools
brew install bash-completion
brew install git
brew install python
brew install jq
brew cleanup
# install global dev deps
npm install -g eslint
npm install -g prettier

# set up terminal
cp .bash_profile ~/.bash_profile
source ~/.bash_profile

# set up vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc-local ~/.vimrc
brew install cmake
brew install the_silver_searcher
cp .tern-config ~/.tern-config
cp .jsconfig.json ~/.jsconfig.json
vim +PluginInstall +qall
vim +PluginUpdate +qall
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --tern-completer
