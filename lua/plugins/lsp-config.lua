return {
    --[[ -- NOT NEEDED FOR NIXOS 
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
               ensure_installed = {"lua_ls" }
           })
        end
    },
    --]]
    {
        -- Lsp configuration
        "neovim/nvim-lspconfig",

        config = function()
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local vs_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
            -- print(vim.inspect(vs_lsp_capabilities))
            vs_lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true
            -- local navbuddy = require("nvim-navbuddy")

            vim.keymap.set('n', '<leader>vi', vim.lsp.buf.hover, {desc = "Show documentation"})
            vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, {desc = "Lsp code action"})

            -- Lua Setup
            vim.lsp.config("lua_ls", {
                cmd = { "/run/current-system/sw/bin/lua-language-server" },
                capabilities = lsp_capabilities,
            })

            -- C++ Setup
            vim.lsp.config("clangd", {
                cmd = { "clangd" },
                name = "clangd_cpp",
                capabilities = lsp_capabilities,
                filetypes = { "cpp", "objcpp", "cuda", "proto", "h" },
                init_options = {
                    fallbackFlags = {'--std=c++23'}
                }
            })

            -- C Setup
            --[[
            vim.lsp.config("clangd_c", {
                cmd = { "/run/current-system/sw/bin/clangd" },
                name = "clangd_c",
                capabilities = lsp_capabilities,
                filetypes = { "c", "objc" },
            })
            --]]


            -- Assembly Setup
            vim.lsp.config("asm_lsp", {
                cmd = { "/run/current-system/sw/bin/asm-lsp" },
                capabilities = lsp_capabilities,
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr }
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                end,
            })

            -- JavaScript Setup
            vim.lsp.config("eslint", {
                -- cmd = { "/run/current-system/sw/bin/vscode-eslint-language-server", "--stdio" },
                cmd = { "/home/jb/.config/nvim/lua/plugins/npm_lsp/node_modules/vscode-langservers-extracted/bin/vscode-eslint-language-server", "--stdio" },
                capabilities = vs_lsp_capabilities,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "html" },
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
                root_dir = function() return vim.loop.cwd() end,
            })

            -- CSS Setup
            vim.lsp.config("cssls", {
                -- cmd = { "/run/current-system/sw/bin/vscode-css-language-server", "--stdio" },
                cmd = { "/home/jb/.config/nvim/lua/plugins/npm_lsp/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server", "--stdio" },
                capabilities = vs_lsp_capabilities,
            })

            -- HTML Setup
            --[[
            vim.lsp.config("html", {
                cmd = { "/run/current-system/sw/bin/vscode-html-language-server", "--stdio" },
                -- cmd = { "/home/jb/.config/nvim/lua/plugins/npm_lsp/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server", "--stdio" },
                capabilities = vs_lsp_capabilities,
                filetypes = { "html" }
            })
            --]]
            vim.lsp.config("efm", {
                cmd = { "/run/current-system/sw/bin/efm-langserver" },
                capabilities = lsp_capabilities,
                filetypes = { "html" },
                init_options = {
                    documentFormatting = true,
                    codeAction = true,
                    hover = true,
                    completion = true,
                },
                settings = {
                    rootMarkers = { ".git/" },
                    languages = {
                        html = {
                            {
                                lintCommand = "htmlhint --format unix",
                                lintStdin = false,
                                lintFormats = { "%f:%l:%c: %m" },
                            }
                        }
                    }
                }
            })

            -- JSON Setup
            vim.lsp.config("jsonls", {
                -- cmd = { "/run/current-system/sw/bin/vscode-json-language-server", "--stdio" },
                cmd = { "/home/jb/.config/nvim/lua/plugins/npm_lsp/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server", "--stdio" },
                capabilities = vs_lsp_capabilities,
            })

            -- Arduino Setup
            vim.lsp.config("arduino_language_server", {
                cmd = { "/run/current-system/sw/bin/arduino-language-server" },
                capabilities = vs_lsp_capabilities,
            })

            -- Python Setup
            vim.lsp.config("pylsp", {
                cmd = {"/run/current-system/sw/bin/pylsp"},
                capabilities = lsp_capabilities,
            })

            -- Rust setup
            vim.lsp.config("rust_analyzer", {
                cmd = {"/run/current-system/sw/bin/rust-analyzer"},
                capabilities = lsp_capabilities,
            })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    if vim.bo[args.buf].buftype ~= "" then
                        return
                    end
                    vim.lsp.start({ bufnr = args.buf })
                end,
            })

            vim.lsp.enable({
                "lua_ls",
                "clangd",
                "rust_analyzer",
                "asm_lsp",
                "arduino_language_server",
                "efm",
                "cssls",
                "jsonls",
                "eslint",
                "pylsp",
            })
        end
    }
}
