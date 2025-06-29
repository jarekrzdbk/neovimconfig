return {
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
                ensure_installed = { "lua_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.perlpls.setup({
                cmd = { '/home/jaro/perl5/bin/pls' },
                settings = {
                    inc = { '/home/jaro/installations/lib', 'home/jaro/perl5/lib' }
                },
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                on_atttach = on_attach,
                cmd = {
                    "rustup", "run", "stable", "rust-analyzer"
                }
            })
            lspconfig.ltex.setup({
                settings = {
                    ltex = {
                        language = "en-GB"
                    }
                }
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover,{})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
