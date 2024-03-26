local opt = vim.opt
local g = vim.g
local wo = vim.wo

-- Map Leader first
g.mapleader = " "

-- UI
opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers
opt.syntax = "on" -- syntax highlight
opt.showmode = false -- no mode
opt.termguicolors = true -- terminal ui color
opt.signcolumn = "yes" -- sign column for LSP
opt.cursorline = true -- highlight whole line
opt.cmdheight = 0 -- no cmd line
opt.laststatus = 3 -- one statusline
opt.breakindent = true -- break indent
-- opt.updatetimk = 250 -- decrease update time
-- opt.timeoutlen = 300 -- faster timeout
opt.splitright = true -- split right
opt.splitbelow = true -- split below

wo.wrap = false

g.have_nerd_font = true

-- Copilot
g.copilot_filetypes = {}

-- Clipboard
opt.clipboard = "unnamedplus"

-- Folding - thanks to Nick Nisi
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

-- Search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- override ignore case when searching with capital

-- Editor
opt.expandtab = true -- spaces over tabs
opt.shiftwidth = 2 -- size of indent
opt.softtabstop = 2 -- 2 space tab
opt.tabstop = 2 -- 2 space tab

-- No Swapfile
opt.swapfile = false

-- Transparency
g.transparent_enabled = true

-- Sometimes mouse
vim.opt.mouse = "a"
