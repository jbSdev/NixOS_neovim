return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "c", "cpp", "javascript", "html", "python" },
            highlight   = { enable = true },
            indent      = { enable = true }
         })
    end
}
