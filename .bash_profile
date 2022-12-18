source ~/.bash_prompt
source ~/.bash_alias

# export PATH with local python installation
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set neovim as default text editor
export VISUAL=nvim
export EDITOR="$VISUAL"
