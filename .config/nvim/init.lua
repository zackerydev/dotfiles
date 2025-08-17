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

vim.g.mapleader = " "

-- Keybinds
vim.keymap.set('n', '<leader>o', ':Neotree toggle=true<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':Neotree toggle=true buffers<CR>', { silent = true })
vim.keymap.set('n', '<laeader>g', ':Neotree toggle=true git_status<CR>', { silent = true })
vim.keymap.set('n', '<Tab>', ':bnext<cr>', { silent = true }, { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<cr>', { silent = true }, { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>O', ':so %<cr>', { silent = true })
vim.keymap.set('n', '<leader>qq', ':cnext<cr>', { desc = 'Next Quickfix' })
vim.keymap.set('n', '<leader>qp', ':cprevoius<cr>', { desc = 'Previous Quickfix' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move Left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move Down' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move Left' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move Up' })

-- Picker
vim.keymap.set('n', '<leader>ff', ':Pick files<cr>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fw', ':Pick grep_live<cr>', { desc = 'Find Word' })
vim.keymap.set('n', '<leader>ll', ':Pick buffers<cr>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', ':Pick help<cr>', { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fr', ':Pick resume<cr>', { desc = 'Resume Last Telescope' })

-- Trouble
vim.keymap.set('n', '<leader>tt', ':Trouble diagnostics toggle<CR>', { desc = 'Trouble Diagnostics' })
vim.keymap.set('n', '<leader>tb', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Trouble Diagnostics' })
vim.keymap.set('n', '<leader>tca', ':Trouble qflist toggle<CR>', { desc = 'Trouble Quickfix' })

-- LSP
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- Packages
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/neanias/everforest-nvim" },
})

-- Plugins
require 'everforest'.setup {}
require 'mason'.setup {}
require 'trouble'.setup {}
require 'mini.pick'.setup {}
require 'mini.basics'.setup {
  options = {
    extra_ui = true,
    win_borders = 'rounded'
  },
  autocommands = {
    relnum_in_visual_mode = true
  }
}

vim.lsp.enable({ "lua_ls" })

vim.cmd("colorscheme everforest")
vim.cmd(":hi statusline guibg=NONE")




-- require 'config.settings'
-- require 'config.lazy'
-- require 'config.keymaps'
-- require 'config.lsp'
-- vim.cmd [[colorscheme everforest]]
