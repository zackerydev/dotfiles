return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 2500,
      lsp_fallback = true,
    },
    formatters = {
      biome = {
        args = { 'format', '--stdin-file-path', '$FILENAME' },
      },
      ['biome-check'] = {
        args = { 'check', '--stdin-file-path', '$FILENAME', '--fix' },
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports', 'gofmt' },
      html = { 'prettier' },
      htmlangular = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      astro = { 'prettier' },
      -- Use a sub-list to run only the first available formatter
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      rust = { 'rustfmt' },
    },
  },
}
