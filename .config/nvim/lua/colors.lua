-- System theme grab
local theme = os.getenv("THEME")

-- Background
vim.o.background = string.lower(theme or "")

vim.g.gruvbox_material_better_performance = 1

vim.g.gruvbox_material_background = "hard"

-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_enable_bold = 1

vim.g.gruvbox_material_transparent_background = 2

vim.g.nord_cursorline_transparent = true
vim.g.nord_disable_background = true
vim.g.nord_contrast = true
vim.g.nord_italic = false

if theme == "LIGHT" then
	require("github-theme").setup({
		options = {
			transparent = true,
		},
	})
else
	-- require("nord").set()
	vim.cmd([[colorscheme gruvbox-material]])
end

-- require("nordic").load({
-- 	transparent_bg = true,
-- 	bold_keywords = true,
-- })
--
-- vim.cmd([[colorscheme nord]])

-- vim.g.gruvbox_material_dim_inactive_windows = 1

-- require("everforest").load()
--
-- require("github-theme").setup({
-- 	options = {
-- 		transparent = true,
-- 		dim_inactive = true,
-- 	},
-- })
--
-- vim.cmd.colorscheme("everforest")

-- Gruvbox Material
--
--
