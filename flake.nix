{
    description = "jb Neovim config for home-manager module";

    inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        homeManagerModules.default = { config, lib, pkgs, ... }: {
            
            options.modules.neovim.enable = lib.mkEnableOption "Neovim editor";
            config = lib.mkIf config.modules.neovim.enable {

                xdg.configFile."nvim/lua".source = "${self}/lua";
                xdg.configFile."nvim/.luarc.json".source = "${self}/.luarc.json";

                programs.neovim = {
                    enable = true;
                    defaultEditor = true;
                    viAlias  = true;
                    vimAlias = true;

                    extraPackages = with pkgs; [
                        # LSP Servers
                        lua-language-server
                        nil                                 # Nix
                        clang-tools                         # C/C++
                        asm-lsp                             # Assembly
                        nodejs                              # NodeJS
                        efm-langserver
                        typescript-language-server          # TS/JS
                        vscode-langservers-extracted        # HTML/CSS/JSON
                        pyright                             # Python
                        python3Packages.python-lsp-server   # pylsp
                        arduino-language-server             # Arduino
                        gopls                               # Go
                        rust-analyzer                       # Rust

                        # Tools
                        ripgrep                             # telescope
                        fg                                  # telescope
                    ];

                    plugins = with pkgs.vimPlugins; [
                        lazy-nvim

                        # Treesitter
                        (nvim-treesitter.withPlugins (p: with p; [
                            tree-sitter-lua
                            tree-sitter-nix
                            tree-sitter-c
                            tree-sitter-cpp
                            tree-sitter-python
                            tree-sitter-rust
                            tree-sitter-go
                            tree-sitter-bash
                            tree-sitter-json
                            tree-sitter-yaml
                            tree-sitter-toml
                            tree-sitter-markdown
                            tree-sitter-html
                            tree-sitter-css
                            tree-sitter-javascript
                            tree-sitter-typescript
                        ]))

                        # LSP
                        nvim-lspconfig
                        none-ls-nvim

                        # Completion
                        nvim-cmp
                        cmp-nvim-lsp
                        cmp-path
                        cmp-buffer
                        luasnip
                        cmp_luasnip
                        friendly-snippets

                        # Telescope
                        telescope-nvim
                        telescope-ui-select-nvim
                        plenary-nvim

                        # UI
                        bufferline-nvim
                        lualine-nvim
                        which-key-nvim
                        neo-tree-nvim
                        nvim-web-devicons
                        nui-nvim
                        mini-nvim

                        # Navigation
                        nvim-navic

                        # Themes
                        tokyonight-nvim
                        catppuccin-nvim

                        # AI
                        copilot-lua
                        copilot-cmp
                        # codecompanion-nvim
                        # markview-nvim

                        # Folding
                        nvim-ufo
                        promise-async
                        statuscol-nvim

                        # Editor
                        nvim-autopairs
                        nvim-ts-autotag
                        # vim-ale
                        tcomment_vim
                        toggleterm-nvim
                        flutter-tools-nvim
                        dressing-nvim

                        # Git
                        lazygit-nvim

                    ];

                    extraLuaConfig = ''
                        require("utils.load_env").load_env()
                        vim.cmd[[highligh Folded guibg=default]]

                        vim.api.nvim_create_autocmd({"BufRead", "BufNewLine"}, {
                            pattern = "*.asm",
                            callback = function()
                                local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
                                if first_line:math("^;%s*nasm") then
                                    vim.bo.filetype = "nasm"
                                elseif first_line:math("^;%s*masm") then
                                    vim.bo.filetype = "masm"
                                else
                                    vim.bo.filetype = "asm"
                                end
                            end,
                        })

                        vim.api.nvim_create_autocmd("FileType", {
                            pattern = "asm,nasm,masm",
                            callback = function()
                                vim.opt_local.tabstop = 8
                                vim.opt_local.shiftwidth = 8
                                vim.opt_local.softtabstop = 8
                            end,
                        })

                        require("vim-options")
                    '';
                };

            };

        };
    };

}
