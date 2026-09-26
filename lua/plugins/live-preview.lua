require('live-preview').setup()

vim.keymap.set('n', "<leader>lps", "<CMD>LivePreview start<CR>",   { desc = "LivePreview start" })
vim.keymap.set('n', "<leader>lpc", "<CMD>LivePreview close<CR>",   { desc = "LivePreview close" })
vim.keymap.set('n', "<leader>lpp", "<CMD>LivePreview preview<CR>", { desc = "LivePreview preview" })
vim.keymap.set('n', "<leader>lph", "<CMD>h livepreview<CR>",       { desc = "LivePreview documentation" })
