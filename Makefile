install:
	# Upgrade all existing apps, if any
	brew update
	brew upgrade

	# Install Some Apps I Like
	brew install --cask alfred
	brew install --cask docker
	brew install --cask firefox
	brew install --cask google-chrome
	brew install --cask google-drive
	brew install --cask iterm2
	brew install --cask obsidian
	brew install --cask slack
	brew install --cask spotify
	brew install --cask whatsapp

	# Install Other Tools
	brew install awscli
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
	brew install gh
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
	brew install python
	brew install ripgrep
	brew install rustup
	brew install tree-sitter
	brew install watch
	brew install yarn

	# Install Work Tools
	brew install argo
	brew install pulumi

	# Clean up
	brew cleanup

setup:
	. ./macos-setup.sh

sync:
	make sync-bash
	make sync-zsh
	make sync-vim
	make sync-neovim
	make sync-k9s
	make sync-packer

sync-bash:
	cp .aliases ~/.aliases
	cp .bash_profile ~/.bash_profile
	cp .bash_prompt ~/.bash_prompt

sync-k9s:
	mkdir -p ~/.config
	cp -r k9s ~/.config/

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

update:
	make install
	make sync
