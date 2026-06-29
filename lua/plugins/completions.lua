local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        completion      = cmp.config.window.bordered(),
        documentation   = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"]   = cmp.mapping.complete(),
        ["<C-e>"]       = cmp.mapping.abort(),
        ["<C-n>"]       = cmp.mapping.scroll_docs(1),
        ["<C-p>"]       = cmp.mapping.scroll_docs(-1),
        ["<C-y>"]       = cmp.mapping.confirm({ select = true }),
    }),
    experimental = {
        ghost_text = true
    },
    sources = cmp.config.sources ({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "copilot" },
        { name = "ale" }
    }),
})
