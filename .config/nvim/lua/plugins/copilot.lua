return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      keymap = {
        accept = "<C-o>", -- handled by nvim-cmp / blink.cmp
      },
    },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
