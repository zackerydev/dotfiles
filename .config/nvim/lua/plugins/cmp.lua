-- Code Completion

return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'Kaiser-Yang/blink-cmp-avante',
  },
  opts = {
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
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },
    sources = {
      default = { 'avante', 'lsp', 'path' },
      providers = {
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
          opts = {
            -- options for blink-cmp-avante
          },
        },
      },
    },
  },
}
