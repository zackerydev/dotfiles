-- Bootstrap Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup {
  'nvim-tree/nvim-web-devicons',
  { 'echasnovski/mini.nvim', version = '*' },
  'nvim-treesitter/nvim-treesitter',
  'nvim-lua/plenary.nvim',
  {
    'williamboman/mason.nvim',
  },
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
  },
  -- Color Schemes
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  -- -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  -- -- Formatting
  'stevearc/conform.nvim',
  -- -- Comment
  'terrortylor/nvim-comment',
  {
    'folke/trouble.nvim',
  },
}
