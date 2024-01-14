return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})
    vim.keymap.set('n', '<C-b>', ':Neotree filesystem focus left<CR>', {})
  end
}
