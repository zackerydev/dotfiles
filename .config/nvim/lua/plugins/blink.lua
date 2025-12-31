return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = { "lsp", "path" },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "show_documentation", "fallback" },
      ["<C-j>"] = { "select_next", "show_documentation", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "select_next",
        "show_documentation",
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-d>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
  },
}
