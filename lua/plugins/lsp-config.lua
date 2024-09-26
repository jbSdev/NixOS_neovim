return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
           --[[ require("mason-lspconfig").setup({
               ensure_installed = {"lua_ls" }
           }) ]]
        end
    },
    {
        -- Lsp configuration
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.keymap.set('n', '<leader>vi', vim.lsp.buf.hover, {desc = "Show documentation"})
            vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, {desc = "Lsp code action"})

            -- Lua Setup
            lspconfig.lua_ls.setup({
                cmd = { "/run/current-system/sw/bin/lua-language-server" },
                capabilities = lsp_capabilities,
           })

            -- C++ Setup
            lspconfig.clangd.setup({
                cmd = { "/run/current-system/sw/bin/clangd" },
                capabilities = lsp_capabilities
            })
        end
    }
}
