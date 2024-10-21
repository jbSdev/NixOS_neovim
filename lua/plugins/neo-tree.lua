return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            popup_border_style = "rounded",
            open_files_do_not_replace_types = {"zsh"}
        })
        vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {desc = "Neotree", silent = true})
    end
}
