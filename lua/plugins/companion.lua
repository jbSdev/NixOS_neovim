require("copilot_cmp").setup()
require("copilot").setup({
    suggestion =  { enabled = false },
    panel = { enable = false },
})
--[[
vim.keymap.set('n', '<leader>cx', ':CodeCompanion chat<CR>',    { desc = "Code Companion Chat" }),
vim.keymap.set('n', '<leader>cc', ':CodeCompanion<CR>',         { desc = "Code Companion Popup" }),
vim.keymap.set('n', '<leader>ca', ':CodeCompanion agent<CR>',   { desc = "Code Companion Agent" })
--]]
