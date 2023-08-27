-- System theme grab
local theme = os.getenv("THEME")

-- Background
vim.o.background = string.lower(theme or "")

vim.g.gruvbox_material_better_performance = 1

vim.g.gruvbox_material_background = "hard"

if theme == "LIGHT" then
	vim.cmd.colorscheme("everforest")
else
	vim.cmd.colorscheme("gruvbox-material")
end

-- Gruvbox Material
--
--
