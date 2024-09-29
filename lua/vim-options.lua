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
    -- b = buffer
    --      c = close
vim.keymap.set('n', '<leader>vn', ':set number!<CR>', {desc = 'Toggle line number'})
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', {desc = 'Next buffer'})
vim.keymap.set('n', '<leader>bc', ':bd<CR>', {desc = 'Close buffer'})

local term_buf = nil
local term_win = nil

function TermToggle(height)
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.cmd("hide")
    else
        vim.cmd("botright new")
        local new_buf = vim.api.nvim_get_current_buf()
        vim.cmd("resize " .. height)
        if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
            vim.cmd("buffer " .. term_buf)  -- go to terminal buffer
            vim.cmd("bd" .. new_buf)        -- cleanup new buffer
        else
            vim.cmd("terminal")
            term_buf = vim.api.nvim_get_current_buf()
            vim.wo.number = false
            vim.wo.relativenumber = false
            vim.wo.signcolumn = "no"
        end
    vim.cmd("startinsert!")
    term_win = vim.api.nvim_get_current_win()
    end
end
