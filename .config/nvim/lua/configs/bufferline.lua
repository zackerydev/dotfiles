require("bufferline").setup {
   options = {
      offsets = {
         {
            filetype = "NvimTree",
            text_align = "left",
            separator = true,
         },
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
   },
   highlights = {
      fill = {
         bg = {
            attribute = "bg",
            highlight = "Normal",
         },
      },
      background = {
         bg = {
            attribute = "bg",
            highlight = "Normal",
         },
      },
      separator = {
         bg = {
            attribute = "bg",
            highlight = "Normal",
         },
      },
      offset_separator = {
         bg = {
            attribute = "bg",
            highlight = "Normal",
         },
      },
   },
}

require("incline").setup()
