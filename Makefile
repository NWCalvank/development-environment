setup:
	. ./macos-setup.sh

sync:
	make sync-bash
	make sync-zsh
	make sync-vim
	make sync-neovim
	make sync-packer

sync-bash:
	cp .aliases ~/.aliases
	cp .bash_profile ~/.bash_profile
	cp .bash_prompt ~/.bash_prompt

sync-neovim:
	mkdir -p ~/.config
	cp -r nvim ~/.config/

sync-packer:
	nvim +PackerSync

sync-vim:
	cp .vimrc-local ~/.vimrc

sync-zsh:
	cp .aliases ~/.aliases
	cp .zshrc ~/.zshrc
