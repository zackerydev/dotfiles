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
      html = { 'prettierd' },
      htmlangular = { 'prettierd' },
      yaml = { 'prettierd' },
      markdown = { 'prettierd' },
      -- Use a sub-list to run only the first available formatter
      javascript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettierd' },
      -- javascript = { 'biome-check' },
      -- javascriptreact = { 'biome-check' },
      -- typescript = { 'biome-check' },
      -- typescriptreact = { 'biome-check' },
      rust = { 'rustfmt' },
    },
  },
}
