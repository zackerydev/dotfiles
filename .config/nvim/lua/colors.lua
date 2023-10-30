-- System theme grab
local theme = os.getenv("THEME")

-- Background
vim.o.background = string.lower(theme or "")

vim.g.gruvbox_material_better_performance = 1

vim.g.gruvbox_material_background = "hard"

-- vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 2
-- vim.g.gruvbox_material_dim_inactive_windows = 1

require("everforest").load()

-- vim.cmd.colorscheme("everforest")

if theme == "LIGHT" then
	vim.cmd.colorscheme("everforest")
else
	vim.cmd.colorscheme("gruvbox-material")
end

-- Gruvbox Material
--
--
