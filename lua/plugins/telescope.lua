local builtin = require("telescope.builtin")
local themes  = require("telescope.themes")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  {desc = 'Grep files'})
vim.keymap.set('n', '<leader>fb', function()
        builtin.buffers(themes.get_dropdown {
            previewer = false,
            --[[
            entry_maker = function(entry)
                local make_entry = require("telescope.make_entry")
                local e = make_entry.gen_from_buffer()(entry)
                local icon = e.icon or ""
                local fname = e.filename or e.value
                e.display = string.format("%s %s", icon, fname)
                return e
            end,
            --]]
        })
end, {desc = 'List buffers'})

require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "node_modules", "%.o$", "%.obj$" }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
}
require("telescope").load_extension("ui-select")
