vim.g.copilot_assume_mapped = true
-- vim.g.copilot_no_tab_map = trouble
vim.cmd "let g:copilot_filetypes={ '*': v:true }"

vim.opt.clipboard = "unnamedplus" -- clipboard sync
vim.opt.number = true -- numbers
vim.opt.signcolumn = "yes" -- sign column
vim.opt.expandtab = true
vim.opt.cmdheight = 0

-- Status Line Stuff
-- vim.opt.winbar = '%m %f'

vim.opt.cursorline = true -- highlight entire line
vim.opt.completeopt = "noinsert,menuone,noselect"
vim.opt.hidden = true -- hide hidden
vim.opt.title = true -- title
vim.opt.mouse = "a" -- sometimes mouse
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.shiftwidth = 2 -- keep space tabs small
vim.opt.tabstop = 2 -- keep tab tabs small
vim.opt.syntax = "on" -- syntax highlighting
vim.opt.termguicolors = true
vim.opt.laststatus = 3
-- vim.opt.statusline = "%#Normal#"
vim.opt.swapfile = false
vim.opt.termguicolors = true

-- code folding settings thanks nick nisi
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.wo.wrap = false

-- needed for scala/nvim-metals
vim.opt_global.shortmess:remove "F"

-- Format on save 
vim.cmd [[  
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]
