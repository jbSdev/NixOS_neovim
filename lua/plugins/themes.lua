return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "tokyonight"
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        -- Decomment to set catppuccin as the colortheme
        --    config = function()
        --        vim.cmd.colorscheme "catppuccin"
        --    end
    }
}
