vim.g.markdown_fenced_languages = {
  'ts=typescript',
}

local on_attach = function(client, bufnr)
  local opts = {}

  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', '<space>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local function lspSymbol(name, icon)
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol('Error', '󰅙')
lspSymbol('Info', '󰋼')
lspSymbol('Hint', '󰌵')
lspSymbol('Warn', '')

--
vim.diagnostic.config {
  virtual_text = {
    prefix = '',
  },
  signs = true,
  underline = false,
  update_in_insert = false,
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'single',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'single',
})

local function drop_deno_lsp(fname, default_root_dir)
  if require('lspconfig').util.root_pattern('deno.json', 'deno.jsonc')(fname) then
    return nil
  end
  return default_root_dir(fname)
end

local handlers = {
  -- The first entryc (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require('lspconfig')[server_name].setup {
      on_attach = on_attach,
    }
  end,
  ['lua_ls'] = function()
    require('lspconfig')['lua_ls'].setup {
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }
  end,
  ['yamlls'] = function()
    require('lspconfig')['yamlls'].setup {
      on_attach = on_attach,
      settings = {
        yaml = {
          schemas = {
            ['https://raw.githubusercontent.com/DataDog/schema/main/service-catalog/v2.1/schema.json'] = '/service.datadog.yaml',
          },
        },
      },
    }
  end,
  ['denols'] = function()
    require('lspconfig')['denols'].setup {
      root_dir = require('lspconfig').util.root_pattern('deno.json', 'deno.jsonc'),
      on_attach = on_attach,
    }
  end,
  ['eslint'] = function()
    require('lspconfig')['eslint'].setup {
      root_dir = function(fname)
        return drop_deno_lsp(fname, require('lspconfig').util.root_pattern('eslint.config.js', '.eslintrc.js', '.eslintrc.json', '.eslintrc'))
      end,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          command = 'EslintFixAll',
        })
        on_attach(client, bufnr)
      end,
    }
  end,
  ['tailwindcss'] = function()
    require('lspconfig')['tailwindcss'].setup {
      root_dir = function(fname)
        return drop_deno_lsp(
          fname,
          require('lspconfig').util.root_pattern('tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'astro.config.mjs')
        )
      end,
      on_attach = on_attach,
    }
  end,
}

return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    -- example using `opts` for defining servers
    opts = {
      servers = {
        lua_ls = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require 'lspconfig'
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'jsonls',
        'rust_analyzer',
        'tailwindcss',
        'denols',
        'biome',
        'eslint',
        'yamlls',
        'gopls',
      },
      handlers = handlers,
    },
  },
}
