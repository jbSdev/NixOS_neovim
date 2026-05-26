return {
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        config = function ()
            require("copilot_cmp").setup()
        end,
        dependencies = {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            config = function ()
                require("copilot").setup({
                    suggestion =  { enabled = false },
                    panel = { enable = false },
                })
            end,
        },
    },
    {
        "olimorris/codecompanion.nvim",
        version = "^18.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function ()
            local tools_enabled = {
                files = { enable = true },
                read_file = { enable = true },
                file_search = { enable = true },
                memory = { enable = true },
            }
            return {
                strategies = {
                    chat = {
                        adapter = "copilot",
                        context = { buffer = true },
                        tools = tools_enabled,
                    },
                    inline = {
                        adapter = "copilot",
                        tools = tools_enabled,
                    },
                    agent = {
                        adapter = "copilot",
                        tools = tools_enabled,
                    },
                },
            }
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
            preview = {
                filetypes = { "markdown", "codecompanion" },
                ignore_buftypes = {}
            }
        }
    }
},

vim.keymap.set('n', '<leader>cx', ':CodeCompanion chat<CR>',    { desc = "Code Companion Chat" }),
vim.keymap.set('n', '<leader>cc', ':CodeCompanion<CR>',         { desc = "Code Companion Popup" }),
vim.keymap.set('n', '<leader>ca', ':CodeCompanion agent<CR>',   { desc = "Code Companion Agent" })
