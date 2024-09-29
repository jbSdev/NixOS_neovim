return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
        require('toggleterm').setup({
            vim.keymap.set('n', '<leader>tt', ':lua TermToggle(12)<CR>', { noremap = true, silent = true }),
            vim.keymap.set('i', '<leader>tt', ':lua TermToggle(12)<CR>', { noremap = true, silent = true }),
            vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
        })
    end
}
