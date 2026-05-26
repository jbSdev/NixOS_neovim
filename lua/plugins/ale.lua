return {
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_ruby_rubocop_auto_correct_all = 1
        g.ale_lint_on_text_changed = 1
        g.ale_use_neovim_diagnostic_api = 1
        g.ale_set_signs = 1
        g.ale_popup_menu_enabled = 1

        g.ale_linters = {
            ruby = {'rubocop', 'ruby'},
            lua = {'lua_ls'},
            html = {'htmlhint', 'eslint'},
            css = {'stylelint'},
            javascript = {'prettier', 'eslint'},
            typescript = {'prettier', 'eslint'},
        }

        g.ale_fixers = {
            ruby = {'rubocop'},
            lua = {'lua_format'},
            html = {'prettier'},
            css = {'stylelint'},
            javascript = {'prettier'},
            typescript = {'prettier'},
        }

        require("ale").setup({
            completion_enabled = true,
            warn_about_trailing_whitespace = true,
        })
    end

}
