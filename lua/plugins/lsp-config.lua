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
                ensure_installed = { "lua_ls", "clangd" },
                highlight = { enable = true }
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
            lspconfig.clangd.setup({
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

            lspconfig.dafny.setup({
                capabilities = capabilities,
                cmd = { '/home/jaro/projects/dafny/Scripts/dafny', 'server', '--documents:verify=onsave', '--verifier:gutterStatus=true'  },
                filetypes = { 'dfy', 'dafny' },
                root_dir = function(fname)
                    return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1] or vim.fn.getcwd())
                end,
                single_file_support = true,
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover,{})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostics list" })

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

        end
    }
}
