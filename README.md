# Shared Dotfiles

A small portable configuration repo for `zsh`, `neovim`, and `starship` that can be used across multiple machines.

## What’s included

- `zsh/` — shell configuration and plugin setup
- `nvim/init.lua` — Neovim Lua config with Lazy.nvim plugin manager
- `starship/starship.toml` — Starship prompt configuration
- `install.sh` — symlink setup and optional tool installation

## Prerequisites

- `git`
- `zsh`
- `neovim`
- `curl` or `wget`
- `starship` (install script can install it automatically if missing)

## Install

Clone this repository to your home machine and run the installer from the repo root:

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then restart your shell or source your new config:

```bash
source ~/.zshrc
```

## Notes

- The installer symlinks `~/.zshrc`, `~/.config/nvim/init.lua`, and `~/.config/starship.toml`.
- Zsh plugins are cloned into `~/.zsh/plugins`.
- Your Neovim config uses `lazy.nvim` and currently includes a theme, Treesitter, and Telescope.

## Customization

- Add zsh aliases and functions in `zsh/aliases.zsh`.
- Update `nvim/init.lua` as your Neovim config grows.
- Change prompt behavior in `starship/starship.toml`.

## Optional Improvements

If you want to expand this repo later, consider:

- Adding a `mksh` or `bash` config for extra shell portability
- Splitting Neovim config into multiple Lua modules
- Using a tool like `stow` for symlink management
- Adding machine-specific overrides via hostname checks
