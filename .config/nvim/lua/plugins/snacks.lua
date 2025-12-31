return {
  "snacks.nvim",
  opts = {
    scroll = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>o",
      function()
        Snacks.explorer()
      end,
    },
  },
}
