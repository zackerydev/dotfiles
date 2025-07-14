return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.basics').setup {
        options = {
          extra_ui = true,
          win_borders = 'default',
        },
        mappings = {
          -- Window navigation with <C-hjkl>, resize with <C-arrow>
          windows = true,
          -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
          move_with_alt = false,
        },
        -- Autocommands. Set to `false` to disable
        autocommands = {
          -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
          basic = true,
          -- Set 'relativenumber' only in linewise and blockwise Visual mode
          relnum_in_visual_mode = true,
        },
        -- Whether to disable showing non-error feedback
        silent = false,
      }

      require('mini.surround').setup()
      require('mini.starter').setup()
      require('mini.icons').setup()
      require('mini.comment').setup()
      require('mini.statusline').setup()
      -- require('mini.notify').setup()
      -- require('mini.tabline').setup()
    end,
  },
}
