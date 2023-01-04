# Setup

Sometimes, you just want to get up-and-running with a new machine. This does
that (if you use Neovim and happen to share all of my current preferences).

## MacOS

```bash
git clone https://github.com/nwcalvank/development-environment.git
cd development-environment
make setup
```

You'll be prompted to provide a password to install Homebrew.

The script completes with an open `.gitconfig` for you to modify.

Time to start coding!

## Ongoing Development

When making changes to your development environment, you can update the files
directly in this repo, and then run the provided Make commands to sync the
relevant configuration.

To sync everything, you can simply re-run the setup command:
```
make setup
```

Or to only update Shell & (Neo)Vim settings:
```
make sync
```

See Makefile for the list of more precise sync commands.

## Credits

After years of neglect, I have updated this setup using inspiration from:
- [ThePrimeagen](https://github.com/ThePrimeagen/init.lua)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
