return {
    'brianhuster/live-preview.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },

    config = function ()
        require('live-preview').setup()
    end,

    keys = {
        { "<leader>lps", "<CMD>LivePreview start<CR>",      desc = "LivePreview start" },
        { "<leader>lpc", "<CMD>LivePreview close<CR>",      desc = "LivePreview close" },
        { "<leader>lpp", "<CMD>LivePreview preview<CR>",    desc = "LivePreview preview" },
        { "<leader>lph", "<CMD>h livepreview<CR>",          desc = "LivePreview documentation" },
    }
}
