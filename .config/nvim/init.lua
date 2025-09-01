-- Globals
local icons = {
  spinner = { '', '', '', '', '', '', '', '', '', '', '', '', '' },
  diagnostics = {
    Error = ' ',
    Warning = ' ',
    Info = ' ',
    Hint = ' ',
  },
  git = {
    LineAdded = '',
    LineModified = '',
    LineRemoved = '',
    LineLeft = '▎',
    LineMiddle = '│',
  },
}

-- Configuration
vim.o.clipboard = 'unnamedplus'
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.tabstop = 2
vim.o.wrap = false
vim.o.swapfile = false
vim.o.cmdheight = 0
vim.o.signcolumn = 'no'
vim.o.laststatus = 3
vim.o.termguicolors = false
vim.o.winborder = 'rounded'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.termguicolors = true

vim.g.mapleader = ' '

-- Packages
vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = 'v3.x' },
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/folke/trouble.nvim' },
  { src = 'https://github.com/neanias/everforest-nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.6.0' },
  { src = 'https://github.com/folke/snacks.nvim' },
  { src = 'https://github.com/chrisgrieser/nvim-origami' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/Bekaboo/dropbar.nvim' },
  { src = 'https://github.com/zbirenbaum/copilot.lua' },
}

-- Plugins
local colors = require 'colors'
require('everforest').setup {}
require('catppuccin').setup {
  background = {
    light = 'latte',
    dark = 'mocha',
    color_overrides = colors,
    transparent_background = false,
    show_end_of_buffer = false,
    integration_default = false,
  },
}
require('mason').setup {}
require('trouble').setup {}
require('origami').setup {}
require('mini.pick').setup {}
require('mini.basics').setup {
  options = {
    extra_ui = true,
    win_borders = 'rounded',
  },
  autocommands = {
    relnum_in_visual_mode = true,
  },
}
require('mason-lspconfig').setup {
  ensure_installed = { 'ts_ls', 'biome', 'lua_ls', 'gopls', 'helm_ls' },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'astro',
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'diff',
    'git_rebase',
    'gitcommit',
    'gitignore',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'json',
    'json5',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'pug',
    'python',
    'regex',
    'ruby',
    'rust',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  highlight = { enable = true, use_languagetree = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
  rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- automatically jump forward to matching textobj
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = false,
      swap_next = { ['<leader>a'] = '@parameter.inner' },
      swap_previous = { ['<leader>A'] = '@parameter.inner' },
    },
  },
}
require('lualine').setup {
  options = {
    theme = 'auto',
    -- globalstatus = true,
    section_separators = '',
    component_separators = '',
    disabled_filetypes = { 'mason', 'lazy', 'NvimTree' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'lsp_status',
        icon = '', -- f013
        symbols = {
          spinner = icons.spinner,
          done = false,
          separator = ' ',
        },
        -- List of LSP names to ignore (e.g., `null-ls`):
        ignore_lsp = {},
      },
    },
    lualine_x = {
      {
        'diff',
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
        symbols = {
          added = icons.git.LineAdded .. ' ',
          modified = icons.git.LineModified .. ' ',
          removed = icons.git.LineRemoved .. ' ',
        },
        colored = true,
        always_visible = false,
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = {
          error = icons.diagnostics.Error,
          hint = icons.diagnostics.Hint,
          info = icons.diagnostics.Info,
          warn = icons.diagnostics.Warning,
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      },
      {
        'filetype',
        icon_only = true,
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
}

require('conform').setup {
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_fallback = true,
  },
  formatters = {
    ['biome-check'] = {
      args = { 'check', '--stdin-file-path', '$FILENAME', '--fix' },
    },
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'goimports', 'gofmt' },
    html = { 'prettier' },
    htmlangular = { 'prettier' },
    htmldjango = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    astro = { 'prettier' },
    -- Use a sub-list to run only the first available formatter
    javascript = { 'biome' },
    javascriptreact = { 'biome' },
    typescript = { 'biome' },
    typescriptreact = { 'biome' },
    rust = { 'rustfmt' },
  },
}

require('blink.cmp').setup {
  keymap = {
    preset = 'default',
    ['<C-k>'] = { 'select_prev', 'show_documentation', 'fallback' },
    ['<C-j>'] = { 'select_next', 'show_documentation', 'fallback' },
    ['<Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      'select_next',
      'show_documentation',
      'fallback',
    },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<C-Space>'] = { 'show', 'show_documentation', 'fallback' },
    ['<C-e>'] = { 'hide', 'fallback' },
    ['<C-d>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  fuzzy = {
    implementation = 'rust',
    prebuilt_binaries = {
      force_version = 'v1.6.0',
    },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },
  sources = {
    default = { 'lsp', 'path' },
  },
}

require('snacks').setup {
  image = {},
  notifier = {},
  statuscolumn = {},
  zen = {},
  git = {},
  gitbrowse = {},
  lazygit = {},
}

require('copilot').setup {
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = '<C-o>',
    },
  },
}

vim.fn.sign_define('DiagnosticSignError', { text = icons.diagnostics.Error, texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = icons.diagnostics.Warning, texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = icons.diagnostics.Info, texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = icons.diagnostics.Hint, texthl = 'DiagnosticSignHint' })

vim.diagnostic.config {
  virtual_lines = true,
}

vim.lsp.config.taplo = {
  filetypes = { 'toml' },
  root_markers = { 'starship.toml', '.git' },
}

-- Keybinds
vim.keymap.set('n', '<leader>o', ':Neotree toggle=true reveal=true<CR>', { silent = true })
vim.keymap.set('n', '<leader>O', ':Neotree toggle=true reveal=true<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':Neotree toggle=true reveal=true buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>g', ':Neotree toggle=true git_status<CR>', { silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })
vim.keymap.set('n', '<Tab>', ':bnext<cr>', { silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<cr>', { silent = true, desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>so', ':so %<cr>', { silent = true })
vim.keymap.set('n', '<leader>qq', ':cnext<cr>', { desc = 'Next Quickfix' })
vim.keymap.set('n', '<leader>qp', ':cprevoius<cr>', { desc = 'Previous Quickfix' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move Left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move Down' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move Left' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move Up' })
vim.keymap.set('n', '<leader>c', ':e ~/.config/nvim/init.lua', { desc = 'Edit Neovim Configuration' })

-- Picker
vim.keymap.set('n', '<leader>ff', ':Pick files<cr>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fw', ':Pick grep_live<cr>', { desc = 'Find Word' })
vim.keymap.set('n', '<leader>ll', ':Pick buffers<cr>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fb', ':Pick buffers<cr>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', ':Pick help<cr>', { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fr', ':Pick resume<cr>', { desc = 'Resume Last Telescope' })

-- Trouble
vim.keymap.set('n', '<leader>tt', ':Trouble diagnostics toggle<CR>', { desc = 'Trouble Diagnostics' })
vim.keymap.set('n', '<leader>tb', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Trouble Diagnostics' })
vim.keymap.set('n', '<leader>tca', ':Trouble qflist toggle<CR>', { desc = 'Trouble Quickfix' })

-- Snacks
vim.keymap.set('n', '<leader>zz', ':lua Snacks.zen()', { desc = 'Zen Mode' })
vim.keymap.set('n', '<leader>gl', ':lua Snacks.lazygit()', { desc = 'Open Lazygit' })
vim.keymap.set('n', '<leader>gb', ':lua Snacks.git.blameline()', { desc = 'Open Git Blame' })
vim.keymap.set('n', '<leader>go', ':lua Snacks.gitbrowse()', { desc = 'Open File on Remote' })

-- LSP
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.cmd 'colorscheme everforest'
