vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.g.mapleader = " "


    -- Creating a keymap
    -- v = visual
    -- n = number
    -- f = files
    --      f = find
    --      g = grep
vim.keymap.set('n', '<leader>vn', ':set number!<CR>', {desc = 'Toggle line number'})
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', {desc = 'Next buffer'})
