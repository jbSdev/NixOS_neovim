require("utils.load_env").load_env()
vim.cmd[[highlight Folded guibg=default]]

-- Setting ASM filetypes based on the first line of the file
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.asm",
    callback = function()
        local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
        if first_line:match("^;%s*nasm") then
            vim.bo.filetype = "nasm"
        elseif first_line:match("^;%s*masm") then
            vim.bo.filetype = "masm"
        else
            vim.bo.filetype = "asm"
        end
    end,
})

-- tabwidth 8 for assembly files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "asm,nasm,masm",
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 8
    end,
})


require("vim-options")
require("plugins")
