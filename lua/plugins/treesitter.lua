-- Parsers are Nix-managed; Neovim 0.10+ auto-enables highlighting
-- Enable treesitter-based indentation for supported filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua", "c", "cpp", "python", "rust", "go",
        "javascript", "typescript", "html", "css",
        "nix", "bash", "json", "yaml", "toml",
    },
    callback = function()
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end,
})
