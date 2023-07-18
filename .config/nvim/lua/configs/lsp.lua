require("mason").setup()
require("mason-lspconfig").setup {
   ensure_installed = {
      "jsonls",
      "rust_analyzer",
      "tailwindcss",
      "tsserver",
      "denols",
   },
}

vim.g.markdown_fenced_languages = {
   "ts=typescript",
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

vim.lsp.buf.format {
   filter = function(c)
      if c.name == "null-ls" and #vim.lsp.get_active_clients { name = "denols", bufnr = 0 } == 0 then
         return true
      end
      return c.name == "denols"
   end,
}

local function drop_deno_lsp(fname, default_root_dir)
   if require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")(fname) then
      return nil
   end
   return default_root_dir(fname)
end

require("mason-lspconfig").setup_handlers {
   -- The first entryc (without a key) will be the default handler
   -- and will be called for each installed server that doesn't have
   -- a dedicated handler.
   function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
         on_attach = on_attach,
      }
   end,
   ["lua_ls"] = function()
      require("lspconfig")["lua_ls"].setup {
         on_attach = on_attach,
         settings = {
            Lua = {
               diagnostics = {
                  globals = { "vim" },
               },
            },
         },
      }
   end,
   ["yamlls"] = function()
      require("lspconfig")["yamlls"].setup {
         on_attach = on_attach,
         settings = {
            yaml = {
               schemas = {
                  ["https://raw.githubusercontent.com/DataDog/schema/main/service-catalog/v2.1/schema.json"] = "/service.datadog.yaml",
               },
            },
         },
      }
   end,
   ["denols"] = function()
      require("lspconfig")["denols"].setup {
         root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
         on_attach = on_attach,
      }
   end,
   ["eslint"] = function()
      require("lspconfig")["eslint"].setup {
         root_dir = function(fname)
            return drop_deno_lsp(
               fname,
               require("lspconfig").util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc")
            )
         end,
         on_attach = on_attach,
      }
   end,
   ["tailwindcss"] = function()
      require("lspconfig")["tailwindcss"].setup {
         root_dir = function(fname)
            return drop_deno_lsp(fname, require("lspconfig").util.root_pattern "tailwind.config.js")
         end,
         on_attach = on_attach,
      }
   end,
   ["tsserver"] = function()
      require("lspconfig")["tsserver"].setup {
         single_file_support = false,
         root_dir = function(fname)
            return drop_deno_lsp(fname, require("lspconfig").util.root_pattern("package.json", "tsconfig.json"))
         end,
         on_attach = function(client, bufnr)
            -- client.resolved_capabilities.document_formatting = false
            -- client.resolved_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
         end,
      }
   end,
}

-- local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"
--
-- local deno_subdirectory = "/path/to/your/deno_subdirectory" -- Replace with your actual subdirectory path
--
-- lspconfig.tsserver.setup {
--    cmd = { "typescript-language-server", "--stdio" },
--    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--    root_dir = function(fname)
--       if fname:sub(1, #deno_subdirectory) == deno_subdirectory then
--          return nil
--       else
--          return util.root_pattern("package.json", "tsconfig.json", ".git")(fname) or util.path.dirname(fname)
--       end
--    end,
-- }
--
-- lspconfig.deno.setup {
--    cmd = { "deno", "lsp" },
--    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--    root_dir = function(fname)
--       if fname:sub(1, #deno_subdirectory) == deno_subdirectory then
--          return util.root_pattern("deps.ts", "mod.ts", "deno.json", "deno.jsonc", "deno.lock", ".git")(fname)
--             or util.path.dirname(fname)
--       else
--          return nil
--       end
--    end,
-- }

-- prevent tsserver and denols competeing
-- local active_clients = vim.lsp.get_active_clients()
-- if client.name == "denols" then
--    for _, client_ in pairs(active_clients) do
--       -- stop tsserver if denols is already active
--       if client_.name == "tsserver" then
--          client_.stop()
--       end
--    end
-- elseif client.name == "tsserver" then
--    for _, client_ in pairs(active_clients) do
--       -- prevent tsserver from starting if denols is already active
--       if client_.name == "denols" then
--          client.stop()
--       end
--    end
-- end

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
