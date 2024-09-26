return {
    'akinsho/bufferline.nvim',
    version = "*",
    diagnostics = "nvim_lsp",
    config = function ()
        local bufferline = require("bufferline")
        vim.opt.termguicolors = true
        bufferline.setup({
            options = {
                style_preset = bufferline.style_preset.no_italic,
                -- keep tabs the same length
                -- enforce_regular_tabs = true,
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer" ,
                        text_align = "center",
                    }
                },
                hover = {
                    enabled = true,
                    delay = 100,
                    reveal = {'close'}
                },
            }
        })
        vim.keymap.set('n', '<C-i>', ':BufferLineCycleNext<CR>', {silent = true})
        vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {silent = true})
    end
}
