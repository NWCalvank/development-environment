# Setup

Sometimes, you just want to get up-and-running with a new machine. This does
that (if you use Neovim and happen to share all of my current preferences).

## MacOS

```bash
git clone https://github.com/nwcalvank/development-environment.git
cd development-environment && ./macos-setup.sh
```

## Packer Package Manager

This setup uses [packer.nvim](https://github.com/wbthomason/packer.nvim) to
manage plugins.

After running the commands above, everything is set up but no packages are
installed.

To install packages, open Neovim:
```bash
nvim
```

Then run the `:PackerSync` command.

Close Neovim with the `:qa` command.

Reopen Neovim:
```bash
nvim
```

Start coding!

## Credits

After years of neglect, I have updated this setup using inspiration from:
- [ThePrimeagen](https://github.com/ThePrimeagen/init.lua)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
