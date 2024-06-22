-- Basic Configuration
local opt = vim.opt
local g = vim.g
local wo = vim.wo
-- Clipboard
opt.clipboard = 'unnamedplus'
-- Editor
opt.expandtab = true -- spaces over tabs
opt.shiftwidth = 2 -- size of indent
opt.softtabstop = 2 -- 2 space tab
opt.tabstop = 2 -- 2 space tab

-- Requires
require('plugins')
require('configs')
require('keymaps')

