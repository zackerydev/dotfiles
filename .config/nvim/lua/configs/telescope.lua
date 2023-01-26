require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical'
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--hidden", "--glob", "" },
    }
  }
}
