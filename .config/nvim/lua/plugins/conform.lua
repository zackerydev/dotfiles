return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters = {
      biome = {
        args = { 'format', '--organize-imports-enabled=true', '--stdin-file-path', '$FILENAME' },
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports', 'gofmt' },
      -- Use a sub-list to run only the first available formatter
      javascript = { 'biome' },
      javascriptreact = { 'biome' },
      typescript = { 'biome' },
      typescriptreact = { 'biome' },
      rust = { 'rustfmt' },
    },
  },
}
