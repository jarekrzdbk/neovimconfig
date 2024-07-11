return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = {"lua", "javascript", "c", "ada", "perl"},
                highlight = {
                    enable = true,
                    --disable = { 'latex' },
                    --disable = function(lang, buf)
                    --    local max_filesize = 100 * 1024 -- 100 KB
                    --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    --    if ok and lang == 'latex' or stats and stats.size > max_filesize then
                    --        return true
                    --    end
                    --end,
                },
                indent = { enable = true },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        --event = "LazyFile",
        enabled = true,
        opts = { mode = "cursor", max_lines = 3 },
        --keys = {
        --    {
        --        "<leader>ut",
        --        function()
        --            local Util = require("lazyvim.util")
        --            local tsc = require("treesitter-context")
        --            tsc.toggle()
        --            if Util.inject.get_upvalue(tsc.toggle, "enabled") then
        --                Util.info("Enabled Treesitter Context", { title = "Option" })
        --            else
        --                Util.warn("Disabled Treesitter Context", { title = "Option" })
        --            end
        --        end,
        --        desc = "Toggle Treesitter Context",
        --    },
        --},
    }
}
