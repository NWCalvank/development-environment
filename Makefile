setup:
	. ./macos-setup.sh

sync:
	make sync-bash
	make sync-vim
	make sync-neovim
	make sync-zsh

sync-bash:
	cp .aliases ~/.aliases
	cp .bash_profile ~/.bash_profile
	cp .bash_prompt ~/.bash_prompt

sync-neovim:
	mkdir -p ~/.config
	cp -r nvim ~/.config/

sync-vim:
	cp .vimrc-local ~/.vimrc

sync-zsh:
	cp .aliases ~/.aliases
	cp .zshrc ~/.zshrc
