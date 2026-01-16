return {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
    },
    vim.keymap.set('n', '<leader>nb', ':Navbuddy<CR>', {noremap = true, silent = true}),
    opts  = {
        window = {
            border = "rounded",
            size = "60%",
        },
        lsp = {
            auto_attach = true,
            preference = nil,
        },
        source_buffer = {
            follow_node = true,
            highlight = false,
        }
    }
}
