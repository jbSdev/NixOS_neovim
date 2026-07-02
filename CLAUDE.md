# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A Neovim configuration packaged as a Nix flake exposing a `homeManagerModules.default` home-manager module. Enabling the module (`modules.neovim.enable = true`) installs Neovim, all LSP servers, and all plugins via Nix, then symlinks `lua/` into `~/.config/nvim/lua/`.

There are two branches:
- **`Nix-managed`** (current): the flake is the source of truth. Plugins and `initLua` are declared in `flake.nix`.
- **`main`**: standalone lazy.nvim config; `init.lua` bootstraps lazy and plugins are installed at runtime.

## Key architectural constraint

**Plugins must be declared in `flake.nix` under `programs.neovim.plugins` before they can be `require()`d in Lua.** Nix pre-installs plugins into the runtime path; lazy.nvim is used only for configuration/lazy-loading, not for downloading. Similarly, LSP servers are in `extraPackages` (put on `$PATH` by Nix) — Mason is not used.

## Entry points

- `flake.nix` → `initLua` string: bootstraps the config, sets up ASM filetype detection, then calls `require("vim-options")`.
- `init.lua`: equivalent standalone entry point for the `main` branch (also calls `require("vim-options")` and `require("lazy").setup("plugins")`).
- `lua/vim-options.lua`: editor options (4-space tabs, `<Space>` leader) and core keymaps.
- `lua/plugins/*.lua`: individual plugin configs loaded by lazy.nvim from the `lua/plugins/` directory.
- `lua/utils/load_env.lua`: reads `~/.config/nvim/.env` and exposes vars to Neovim (used for API keys, e.g. Copilot).

## Applying changes

After editing `flake.nix` (e.g. adding a plugin or LSP), rebuild with home-manager:

```sh
home-manager switch --flake .#<username>
```

Lua-only changes (files under `lua/`) take effect immediately on the next Neovim launch because the directory is symlinked.

## Key keymaps (leader = Space)

| Keymap | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree |
| `<leader>ff` / `fg` / `fb` | Telescope: find files / live grep / buffers |
| `<leader>cf` | Format buffer (LSP) |
| `<leader>vi` | LSP hover docs |
| `<leader>vca` | LSP code action |
| `<C-Tab>` | Next buffer |
| `<leader>bc` | Close buffer |

Completion: `<C-y>` confirm, `<C-Space>` trigger, `<C-e>` abort.
