--- Color Schemes

return {
  {
    'comfysage/evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'fall',
        accent = 'green',
      },
      transparent_background = true,
      overrides = {
        AvanteSidebarWinHorizontalSeparator = {
          fg = '#1C2225',
          bg = '#1C2225',
        },
        AvanteSidebarWinSeparator = {
          fg = '#1C2225',
          bg = '#1C2225',
        },
      },
    },
  },
}
