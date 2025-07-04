install:
	# Upgrade all existing apps, if any
	brew update
	brew upgrade

	# Set up taps
	brew tap hashicorp/tap
	brew tap sqitchers/sqitch

	# Install Some Apps I Like
	brew install --cask alfred
	brew install --cask docker
	brew install --cask expressvpn
	brew install --cask firefox
	brew install --cask google-chrome
	brew install --cask google-drive
	brew install --cask iterm2
	brew install --cask obsidian
	brew install --cask slack
	brew install --cask spotify
	brew install --cask sqlectron
	brew install --cask whatsapp

	# Install Work Apps
	brew install --cask aws-vpn-client
	brew install --cask google-cloud-sdk
	brew install --cask microsoft-teams
	gcloud components install gke-gcloud-auth-plugin

	# Install Other Tools
	brew install argocd
	brew install awscli
	brew install aws-iam-authenticator
	brew install bash-completion
	brew install brotli
	brew install brogue
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
	brew install lua
	brew install nasm
	brew install neovim
	brew install postgresql@15
	brew install pyenv
	brew install pyenv-virtualenv
	brew install python
	brew install ripgrep
	brew install rustup
	brew install tree-sitter
	brew install watch
	brew install wget
	brew install yarn

	# Install Work Tools
	brew install argo
	brew install azure-cli
	brew install pulumi

	# Install Tap Apps
	brew install hashicorp/tap/terraform
	brew install sqitch --with-postgres-support

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

sync-bash:
	cp .aliases ~/.aliases
	cp .bash_profile ~/.bash_profile
	cp .bash_prompt ~/.bash_prompt

sync-k9s:
	mkdir -p ~/.config
	cp -r k9s ~/.config/

sync-neovim:
	mkdir -p ~/.config
	rm -r ~/.config/nvim
	cp -r nvim ~/.config/

sync-vim:
	cp .vimrc-local ~/.vimrc
	cp .vimrc-local ~/Google\ Drive/My\ Drive/Obsidian/HelloWorld/.vimrc

sync-zsh:
	touch .env
	cp .aliases ~/.aliases
	cp .env ~/.env
	cp .zshrc ~/.zshrc

update:
	make install
	make sync
