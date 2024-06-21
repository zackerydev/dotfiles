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
  -- File Tree
  'nvim-tree/nvim-web-devicons',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
  },
  'tpope/vim-dadbod',
  'towolf/vim-helm',
  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.3' },
  -- Color Schemes
  'sainnhe/gruvbox-material',
  'shaunsingh/nord.nvim',
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  'projekt0n/github-nvim-theme',
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        -- Your config here
        background = 'hard',
        transparent_background_level = 2,
        italics = true,
        on_highlights = function(hl, palette)
          hl.StatusLineNC = { fg = palette.none, bg = palette.none, sp = palette.red }
        end,
      }
    end,
  },
  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'nvim-treesitter/nvim-treesitter',
  -- Formatting
  'stevearc/conform.nvim',
  -- Comment
  'terrortylor/nvim-comment',
  -- Completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  -- GitHub Copilot
  -- "github/copilot.vim",
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
            accept_word = false,
            accept_line = false,
            next = '<C-J>',
            prev = '<C-K>',
            dismiss = '<C-]>',
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = true,
          gitcommit = true,
          gitrebase = true,
          hgcommit = true,
          svn = true,
          cvs = true,
          ['.'] = true,
        },
      }
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {
      mode = 'document_diagnostics',
    },
  },
  { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
  'nvim-lualine/lualine.nvim',
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.export'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }
    end,
  },
  -- markdown plugins
  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },
  { 'dhruvasagar/vim-table-mode' },
}

require 'configs'
