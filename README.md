# NixOS_neovim

### Used plugins

 - [Lazy](https://github.com/folke/lazy.nvim)
 - [Autopairs](https://github.com/windwp/nvim-autopairs)
 - [Bufferline](https://github.com/akinsho/bufferline.nvim)
 - [tcomment](https://github.com/tomtom/tcomment_vim)
 - [Cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
 - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
 - [Nvim-cpm](https://github.com/hrsh7th/nvim-cmp)
 - [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
 - [Lualine](https://github.com/nvim-lualine/lualine.nvim)
 - [mini.icons](https://github.com/echasnovski/mini.icons)
 - [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
 - [None-ls](https://github.com/nvimtools/none-ls.nvim)
 - [Telescope](https://github.com/nvim-telescope/telescope.nvim)
 - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 - [Which-key](https://github.com/folke/which-key.nvim)

Themes:
 - [Tokyonight](https://github.com/folke/tokyonight.nvim)
 - [Catpuccin](https://github.com/catppuccin/nvim) (disabled)
 
 ---

LSPs require an installed language server on the machine, not by Mason, but using a NixOS configuration file. You just need to parse the path to that language server inside Lazy's plugin config (`/lua/lsp-config.lua` in this repo example), like that:

```lua
lspconfig.lua_ls.setup({
    cmd = { "/run/current-system/sw/bin/lua-language-server" },
    capabilities = lsp_capabilities,
})
```
