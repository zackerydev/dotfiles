require("telescope").setup {
   defaults = {
      layout_strategy = "horizontal",
   },
   pickers = {
      find_files = {
         find_command = { "fd", "--hidden", "--glob", "--type=file", "" },
      },
   },
}
