#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
brew install cmake
brew install the_silver_searcher
cp .tern-config ~/.tern-config
cp .jsconfig.json ~/.jsconfig.json
vim +PluginInstall +qall
vim +PluginUpdate +qall
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --tern-completer
