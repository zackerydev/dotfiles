local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup {
   sources = {
      -- go
      require("null-ls").builtins.formatting.gofmt,
      -- Lua
      require("null-ls").builtins.formatting.stylua,

      -- JS/TS
      require("null-ls").builtins.formatting.prettierd,
      require("null-ls").builtins.diagnostics.tsc,

      -- Deno ?
      -- require("null-ls").builtins.formatting.deno_fmt,

      -- Others
      require("null-ls").builtins.diagnostics.yamllint,
   },
   on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
         vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
         vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
               -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
               vim.lsp.buf.format { bufnr = bufnr }
            end,
         })
      end
   end,
}
