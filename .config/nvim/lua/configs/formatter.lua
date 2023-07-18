local filetypes = require "formatter.filetypes"

require("formatter").setup {
   logging = true,
   filetype = {
      lua = {
         filetypes.lua.stylua,
      },
      typescript = {
         filetypes.typescript.prettierd,
      },
      typescriptreact = {
         filetypes.typescript.prettierd,
      },
   },
}
