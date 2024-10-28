return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    opts = {
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
    },
    event = 'InsertEnter',
  },
}
