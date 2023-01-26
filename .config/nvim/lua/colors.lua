theme = os.getenv "THEME"

vim.g.everforest_background = "soft"
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_transparent_background = 1

vim.o.background = string.lower(theme)

vim.cmd.colorscheme "everforest"

-- require("github-theme").setup {
--    theme_style = theme,
-- }
--
-- local flavour = "mocha"
--
-- if theme == "LIGHT" then
--    flavour = "latte"
-- end
-- require("catppuccin").setup {
--    flavour = flavour,
--    transparent_background = true,
-- }
-- vim.cmd.colorscheme "catppuccin"
--
-- vim.o.background = 'light'
--
-- vim.cmd[[colorscheme edge]]

-- vim.g.tokyonight_style = "day"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer"

-- vim.cmd[[colorscheme tokyonight]]
