require("mason").setup()
require("mason-lspconfig").setup {
   ensure_installed = {
      "jsonls",
      "rust_analyzer",
      "tailwindcss",
      "tsserver",
   },
}

local on_attach = function(client, bufnr)
   local opts = {}

   local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

   vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   vim.keymap.set("n", "<space>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   vim.keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
   vim.keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local function lspSymbol(name, icon)
   local hl = "DiagnosticSign" .. name
   vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")
--
vim.diagnostic.config {
   virtual_text = {
      prefix = "",
   },
   signs = true,
   underline = false,
   update_in_insert = false,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})

require("mason-lspconfig").setup_handlers {
   -- The first entry (without a key) will be the default handler
   -- and will be called for each installed server that doesn't have
   -- a dedicated handler.
   function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
         on_attach = on_attach,
      }
   end,
   ["sumneko_lua"] = function()
      require("lspconfig")["sumneko_lua"].setup {
         on_attach = on_attach,
         settings = {
            Lua = {
               completion = {
                  workspaceWord = false,
                  showWord = "Disable",
               },
               diagnostics = {
                  globals = { "vim", "use" },
               },
            },
         },
      }
   end,
   ["tsserver"] = function()
      require("lspconfig")["tsserver"].setup {
         on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
         end,
      }
   end,
}

-- local lsp_installer = require("nvim-lsp-installer")
--
-- -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- -- or if the server is already installed).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--
--     local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--
--
--
--     vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--     vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--     vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--     vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--     vim.keymap.set('n', '<space>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--     vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--     vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--     vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--     vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--     vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--     vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--     vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--     vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--
--     if server.name == "sumneko_lua" then
--       opts.settings = {
--         Lua = {
--           completion = {
--             workspaceWord = false,
--             showWord =  'Disable'
--           },
--           diagnostics = {
--             globals = { 'vim', 'use' }
--           }
--         }
--       }
--     end
--
--     if server.name == "tsserver" then
--       opts.on_attach = function(client)
--           client.resolved_capabilities.document_formatting = false
--           client.resolved_capabilities.document_range_formatting = false
--       end
--     end
--
--
--     server:setup(opts)
-- end)
--
--  local function lspSymbol(name, icon)
--     local hl = "DiagnosticSign" .. name
--     vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
--  end
--
--  lspSymbol("Error", "")
--  lspSymbol("Info", "")
--  lspSymbol("Hint", "")
--  lspSymbol("Warn", "")
-- --
--  vim.diagnostic.config {
--     virtual_text = {
--        prefix = "",
--     },
--     signs = true,
--     underline = true,
--     update_in_insert = false,
--  }
--
--  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--     border = "single",
--  })
--  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--     border = "single",
--  })
