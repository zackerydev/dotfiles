require("null-ls").setup({
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]])
        end
    end,
    sources = {
        -- Lua
        require("null-ls").builtins.formatting.stylua,

        -- JS/TS
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.diagnostics.tsc,

        -- Deno ?
        -- require("null-ls").builtins.formatting.deno_fmt,

        -- Others
        require("null-ls").builtins.diagnostics.yamllint
    },
})
