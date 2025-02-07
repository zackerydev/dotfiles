local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Neotree
map('n', '<leader>o', ':Neotree toggle=true<cr>', { silent = true }, { desc = 'Open Neotree' })
map('n', '<leader>b', ':Neotree toggle=true buffers<CR>', { silent = true }, { desc = 'Open Neotree (Buffers)' })
map('n', '<leader>g', ':Neotree toggle=true git_status<CR>', { silent = true }, { desc = 'Open Neotree (Git Status)' })

map('n', '<Tab>', ':bnext<cr>', { desc = 'Next Buffer' })
map('n', '<S-Tab>', ':bprevious<cr>', { desc = 'Previous Buffer' })

-- Quick Fix Navigation
map('n', '<leader>qq', ':cnext<cr>', { desc = 'Next Quickfix' })
map('n', '<leader>qp', ':cprevious<cr>', { desc = 'Previous Quickfix' })

-- Telescope

map('n', '<leader>ff', ':Telescope find_files<cr>', { desc = 'Find Files' })
map('n', '<leader>fw', ':Telescope live_grep<cr>', { desc = 'Find Word' })
map('n', '<leader>fb', ':Telescope buffers<cr>', { desc = 'Find Buffers' })
map('n', '<leader>jj', ':Telescope buffers<cr>', { desc = 'Find Buffers' })
map('n', '<leader>ll', ':Telescope buffers<cr>', { desc = 'Find Buffers' })
map('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = 'Find Help' })
map('n', '<leader>fr', ':Telescope resume<cr>', { desc = 'Resume Last Telescope' })

-- LSP
-- Trouble
-- map('n', '<leader>tt', ':Trouble diagnostics toggle<CR>', { desc = 'Trouble Diagnostics' })
-- map('n', '<leader>tca', ':Trouble qflist toggle<CR>', { desc = 'Trouble Quickfix' })

-- fuGITive
map('n', '<leader>gp', ':G push<cr>', { desc = 'Git Push' })
map('n', '<leader>gs', ':G status<cr>', { desc = 'Git Status' })
map('n', '<leader>gd', ':G diff<cr>', { desc = 'Git Diff' })
map('n', '<leader>gpf', ':G push -f<cr>', { desc = 'Git Push Force' })
map('n', '<leader>gc', ':G commit<cr>', { desc = 'Git Commit' })
map('n', '<leader>gca', ':G commit -a --amend<cr>', { desc = 'Git Commit Amend' })

-- Folding
map('n', '<leader>c', 'za', { desc = 'Toggle Fold' })
map('v', '<leader>c', 'za', { desc = 'Toggle Fold' })

map('n', '<leader>l', 'za', { desc = 'Toggle Fold' })
map('v', '<leader>l', 'zc', { desc = 'Close Fold' })

map('n', '<leader>O', 'zM', { desc = 'Close All Folds' })
map('v', '<leader>O', 'zM', { desc = 'Close All Folds' })

map('n', '<leader>L', 'zR', { desc = 'Open All Folds' })
map('v', '<leader>L', 'zR', { desc = 'Open All Folds' })

-- Neorg
map('i', '<C-d>', '<Plug>(neorg.tempus.insert-date.insert-mode)')

-- Dap
vim.keymap.set('n', '<leader>dd', function()
  require('dap').continue()
end, { desc = 'Debug' })
vim.keymap.set('n', '<leader>dn', function()
  require('dap').step_over()
end, { desc = 'Debug Next' })
vim.keymap.set('n', '<leader>di', function()
  require('dap').step_into()
end, { desc = 'Step Into' })
vim.keymap.set('n', '<leader>do', function()
  require('dap').step_out()
end, { desc = 'Step Out' })
vim.keymap.set('n', '<leader>b', function()
  require('dap').toggle_breakpoint()
end, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint()
end, { desc = 'Set Breakpoint' })
vim.keymap.set('n', '<leader>lp', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
end, { desc = 'Log Point' })
vim.keymap.set('n', '<leader>dr', function()
  require('dap').repl.open()
end, { desc = 'Open Repl' })
vim.keymap.set('n', '<leader>dl', function()
  require('dap').run_last()
end, { desc = 'Run Last' })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end, { desc = 'Hover' })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end, { desc = 'Preview Widget' })
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.frames)
end, { desc = 'Frames Widget' })
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end, { desc = 'Scopes Widget' })
