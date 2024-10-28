return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    opts = {
      defaults = {
        layout_strategy = 'horizontal',
      },
      pickers = {
        find_files = {
          find_command = { 'fd', '--hidden', '--glob', '--type=file', '' },
        },
      },
    },
  },
}
