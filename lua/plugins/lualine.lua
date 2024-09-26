return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            theme = 'palenight',
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            extensions = {'neo-tree'}
        })
    end
}
