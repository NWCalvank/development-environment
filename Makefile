install:
	# Upgrade all existing apps, if any
	brew update
	brew upgrade

	# Set up taps
	brew tap hashicorp/tap
	brew tap sqitchers/sqitch

	# Install Some Apps I Like
	brew install --cask alfred
	brew install --cask balenaetcher
	brew install --cask docker
	brew install --cask expressvpn
	brew install --cask firefox
	brew install --cask ghostty
	brew install --cask google-chrome
	brew install --cask google-drive
	brew install --cask obsidian
	brew install --cask sqlectron
	brew install --cask tailscale-app
	brew install --cask whatsapp

	# Install Work Apps
	brew install --cask aws-vpn-client
	brew install --cask google-cloud-sdk
	brew install --cask microsoft-teams
	brew install --cask slack
	gcloud components install gke-gcloud-auth-plugin

	# Install Other Tools
	brew install aws-iam-authenticator
	brew install bash-completion
	brew install brotli
	brew install c-ares
	brew install ca-certificates
	brew install cmake
	brew install eksctl
	brew install gdbm
	brew install gettext
	brew install giflib
	brew install git
	brew install gmp
	brew install go
	brew install helm
	brew install icu4c
	brew install isl
	brew install jpeg
	brew install jpeg-turbo
	brew install krb5
	brew install lua
	brew install mise
	brew install nasm
	brew install neovim
	brew install ripgrep
	brew install rustup
	brew install stats
	brew install talosctl
	brew install tree-sitter
	brew install watch
	brew install wget
	brew install yarn

	# Install Work Tools
	brew install azure-cli

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
	mkdir -p ~/.config/nvim
	rm -r ~/.config/nvim
	cp -r nvim ~/.config/

sync-vim:
	cp .vimrc-local ~/.vimrc
	cp .vimrc-local ~/Google\ Drive/My\ Drive/Obsidian/HelloWorld/.vimrc

sync-zsh:
	mkdir -p ~/.config/mise
	cp mise-global.toml ~/.config/mise/config.toml
	cp .aliases ~/.aliases
	cp .zshrc ~/.zshrc

update:
	make install
	make sync
