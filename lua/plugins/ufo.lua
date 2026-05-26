return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                local builtin = require("statuscol.builtin")
                require("statuscol").setup({
                    relculright = true,
                    segments = {
                        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                        { text = { "%s" }, click = "v:lua.ScSa" },
                        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                    },
                })
            end,
        }
    },
    event = {"VeryLazy", "BufReadPost"},
    opts = {
        provider_selector = function()
            return {"treesitter", "indent"}
        end,
    },
    config = function()
        -- vim configuration
        vim.o.foldcolumn = '1'
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99

        local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
        local language_servers = vim.lsp.get_clients()
        local lspconfig = require("lspconfig")

        lsp_capabilities.textDocument.foldingRange = {
            -- dynamicRegistration = false,
            lineFoldingOnly = true
        }

        for _, ls in ipairs( language_servers) do
            lspconfig[ls].setup({
                capabilities = lsp_capabilities;
            })
        end
        require('ufo').setup({
            close_fold_kinds_for_fr = {
                default = {'imports', 'comment'},
                c = {'comment', 'region'}
            },
        })

        -- Keymaps
        vim.keymap.set('n', '<leader>za', 'za', { desc = "Toggle fold at cursor", silent = true })
        vim.keymap.set('n', '<leader>zo', require('ufo').openAllFolds, { desc = "Open all folds", silent = true })
        vim.keymap.set('n', '<leader>zc', require('ufo').closeAllFolds, { desc = "Close all folds", silent = true })
    end
}
