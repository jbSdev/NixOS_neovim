return {
    "tomtom/tcomment_vim",
    config = function ()
        vim.keymap.set('n', '<leader>/', ':TComment<CR>', { desc = "Toggle comment" });
        vim.keymap.set('v', '<leader>/', ':TCommentBlock<CR>', { desc = "Toggle comment" });
    end
}
