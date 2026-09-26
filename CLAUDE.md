# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A Neovim configuration packaged as a Nix flake exposing a `homeManagerModules.default` home-manager module. Enabling the module (`modules.neovim.enable = true`) installs Neovim, all LSP servers, and all plugins via Nix, then symlinks `lua/` into `~/.config/nvim/lua/`.

The flake is the source of truth: plugins, LSP servers, and `initLua` are declared in `flake.nix`. Nix pre-installs everything into the runtime path; there is no lazy.nvim/Mason bootstrapping at runtime.

## Key architectural constraint

**Plugins must be declared in `flake.nix` under `programs.neovim.plugins` before they can be `require()`d in Lua.** LSP servers are declared in `extraPackages` (put on `$PATH` by Nix) — Mason is not used.

## Entry points

- `flake.nix` → `initLua` string: bootstraps the config, sets up ASM filetype detection, then calls `require("vim-options")`.
- `init.lua`: equivalent standalone entry point (calls `require("vim-options")` and `require("plugins")` directly, without the home-manager module).
- `lua/vim-options.lua`: editor options (4-space tabs, `<Space>` leader) and core keymaps.
- `lua/plugins/*.lua`: individual plugin configs, `require()`d directly from `lua/plugins.lua` (plugins themselves are installed by Nix, not lazy.nvim).
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
