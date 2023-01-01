sync-bash:
	cp .bash_alias ~/.bash_alias
	cp .bash_profile ~/.bash_profile
	cp .bash_prompt ~/.bash_prompt
	source ~/.bash_profile

sync-neovim:
	mkdir -p ~/.config
	cp -r nvim ~/.config/

sync-vim:
	cp .vimrc-local ~/.vimrc

sync:
	make sync-bash
	make sync-vim
	make sync-neovim
