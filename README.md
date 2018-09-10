# Setup

1. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
1. `npm i -g prettier --dev`
1. `git clone https://github.com/nwcalvank/development-environment.git`
1. `cd development-environment && cp .vimrc ~/.vimrc`
1. `brew install cmake`
1. `brew install the_silver_searcher`
1. `:PluginInstall`

## YouCompleteMe

1. `cd ~/.vim/bundle/YouCompleteMe && ./install.py --tern-completer'`
1. Create ~/.tern-config

Example:

```json
{
  "libs": ["browser", "react"],
  "plugins": {
    "angular": {},
    "doc_comment": null,
    "es_modules": {},
    "node": {}
  },
  "dontLoad": ["node_modules/**"]
}
```

1. Create .jsconfig.json

```json
{
    "compilerOptions": {
        "checkJs": true
    }
}
```

# TODO

- [ ] Automate git repo clones
- [ ] Automate Prettier installation
- [ ] Automate YouCompleteMe installation + setup
