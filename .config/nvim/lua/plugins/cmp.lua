-- Code Completion

return {
  'saghen/blink.cmp',
  version = '0.8.x',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
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
      default = { 'lsp', 'path' },
    },
  },
  --
  --   -- 'hrsh7th/cmp-nvim-lsp',
  --   -- 'hrsh7th/cmp-buffer',
  --   -- 'hrsh7th/cmp-path',
  --   -- 'hrsh7th/cmp-cmdline',
  --   -- 'hrsh7th/cmp-vsnip',
  --   -- 'hrsh7th/vim-vsnip',
  --   -- {
  --   --   'hrsh7th/nvim-cmp',
  --   --   config = function()
  --   --     local cmp = require 'cmp'
  --   --     cmp.setup {
  --   --       snippet = {
  --   --         -- REQUIRED - you must specify a snippet engine
  --   --         expand = function(args)
  --   --           vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
  --   --         end,
  --   --       },
  --   --       mapping = {
  --   --         ['<C-k>'] = cmp.mapping.select_prev_item(),
  --   --         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  --   --         ['<C-j>'] = cmp.mapping.select_next_item(),
  --   --         ['<Tab>'] = cmp.mapping.select_next_item(),
  --   --         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  --   --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --   --         ['<C-Space>'] = cmp.mapping.complete(),
  --   --         ['<C-e>'] = cmp.mapping.close(),
  --   --         ['<CR>'] = cmp.mapping.confirm {
  --   --           behavior = cmp.ConfirmBehavior.Replace,
  --   --           select = true,
  --   --         },
  --   --       },
  --   --       -- sorting = {
  --   --       -- 	priority_weight = 2,
  --   --       -- 	comparators = {
  --   --       -- 		require("copilot_cmp.comparators").prioritize,
  --   --       --
  --   --       -- 		-- Below is the default comparitor list and order for nvim-cmp
  --   --       -- 		cmp.config.compare.offset,
  --   --       -- 		-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
  --   --       -- 		cmp.config.compare.exact,
  --   --       -- 		cmp.config.compare.score,
  --   --       -- 		cmp.config.compare.recently_used,
  --   --       -- 		cmp.config.compare.locality,
  --   --       -- 		cmp.config.compare.kind,
  --   --       -- 		cmp.config.compare.sort_text,
  --   --       -- 		cmp.config.compare.length,
  --   --       -- 		cmp.config.compare.order,
  --   --       -- 	},
  --   --       -- },
  --   --       sources = cmp.config.sources {
  --   --         { name = 'nvim_lsp' },
  --   --         { name = 'vsnip' },
  --   --         -- { name = "copilot" },
  --   --         -- {name = "buffer", keyword_length = 5, max_item_count = 5},
  --   --       },
  --   --     }
  --   --   end,
  --   -- },
}
