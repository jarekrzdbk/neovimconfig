vim.cmd("set expandtab")
--vim.cmd("set noexpandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.wo.number = true
vim.o.cursorline = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
--vim.opt.listchars = "eol:¬,tab:>-,trail:~,extends:>,precedes:<"
--vim.opt.listchars = { eol = '↴', tab = '-', trail = '•', space = '·', precedes = '«', extends = '»', nbsp = '␣' }
vim.opt.listchars = { tab = '▸-', trail = '•', space = '·', precedes = '«', extends = '»', nbsp = '␣' }
--vim.opt.listchars = { eol = '↴', tab = ' ', trail = '•', space = '·', precedes = '«', extends = '»', nbsp = '␣' }

vim.opt.list = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.require'util'.ui.foldtext()"

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.statuscolumn = [[%!v:lua.require'util'.ui.statuscolumn()]]
end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.require'util'.ui.foldexpr()"
else
  vim.opt.foldmethod = "indent"
end

vim.api.nvim_set_keymap('v', '<leader>t', ":retab!<CR>", { noremap = true, silent = true })
