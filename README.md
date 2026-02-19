# MacOS Development Environment

Declarative configuration for a MacOS development environment, using:
- [Homebrew](https://brew.sh/) for application management
- [Mise](https://mise.jdx.dev/) for development environment management

Notable Tools:
- [Ghostty](https://ghostty.org/): Terminal emulator
- [K9s](https://k9scli.io/): Kubernetes TUI
- [NeoVim](https://neovim.io/): Text editor
- [Obsidian](https://obsidian.md/): Note-taking app
- [Pulumi](https://www.pulumi.com/): Infrastructure as code
- [Tailscale](https://tailscale.com/): Private network

## Getting Started

In a bash terminal (must be bash!):

```bash
git clone https://github.com/nwcalvank/development-environment.git
cd development-environment
make setup
```
> [!NOTE]
> View full setup script [here](./macos-setup.sh).

You'll be prompted to provide a password to install Homebrew.

The script completes with an open `.gitconfig` for you to modify.

Time to start coding!

## Ongoing Development

The update command pulls latest versions of the applications and installs any
newly-added apps.

Either of the following is supported:

```bash
make update
```

```bash
mise run update
```

## Customization

The following environment variables can be used to customize behaviour.

| Variable | Description | Default Value |
| --- | --- | --- |
| `NEOVIM_DAY_THEME` | Colour theme used during daylight hours | dayfox |
| `NEOVIM_NIGHT_THEME` | Colour theme used during nighttime hours | nightfox |
| `PRIMARY_PROJECT` | Directory to enter via alias `code` | unset |
