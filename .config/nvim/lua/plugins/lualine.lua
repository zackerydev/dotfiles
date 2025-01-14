local colors = {
  bg = '#1d2021', -- Background color (hard contrast)
  fg = '#ebdbb2', -- Foreground color
  yellow = '#fabd2f', -- Brighter yellow
  cyan = '#8ec07c', -- Brighter cyan/greenish
  darkblue = '#458588', -- Teal/blue
  green = '#b8bb26', -- Brighter green
  orange = '#fe8019', -- Brighter orange
  violet = '#d3869b', -- Magenta/purple shade
  magenta = '#d3869b', -- Soft magenta
  blue = '#83a598', -- Light blue/tealish
  red = '#fb4934', -- Brighter red
}
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'auto',
      component_separators = '',
      section_separators = '',
    },
    normal = { a = { fg = colors.orange } },
    sections = {
      lualine_a = { { 'mode', color = { bg = 'none', fg = colors.fg } } },
      lualine_b = { { 'branch', color = { fg = colors.green, bg = 'none' } } },
      lualine_c = {
        '%=', --[[ add your center compoentnts here in place of this comment ]]
      },
      lualine_x = {},
      lualine_y = {
        {
          'diagnostics',
          sources = { 'nvim_lsp' },
          color = { bg = 'none', fg = colors.fg },
          colored = true,
          symbols = {
            error = ' ',
            warn = ' ',
            info = ' ',
            hint = ' ',
          },
        },
      },
      lualine_z = {
        { 'filetype', color = { bg = 'none', fg = colors.fg } },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_c = { 'filename' },
    },
    inactive_winbar = {
      lualine_c = { 'filename' },
    },
    extensions = {
      'neo-tree',
      'trouble',
      'mason',
    },
  },
}
