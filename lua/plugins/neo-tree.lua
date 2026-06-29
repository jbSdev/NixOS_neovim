require("neo-tree").setup({
    popup_border_style = "rounded",
    open_files_do_not_replace_types = {"zsh"}
})
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {desc = "Neotree", silent = true})
