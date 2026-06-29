local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('arduino-nvim').setup({
    clang = "/run/current-system/sw/bin/clangd",
    arduino = "/run/current-system/sw/bin/arduino-cli",
    capabilities = lsp_capabilities,
    filetypes = { "arduino" }
});
