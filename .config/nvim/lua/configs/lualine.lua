local theme = os.getenv("THEME")
local lualine_theme = "nordic"

if theme == "LIGHT" then
	lualine_theme = "everforest"
end

require("lualine").setup({
	options = {
		theme = lualine_theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
		ignore_focus = {
			"neo-tree",
		},
		separator = nil,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "" },
		lualine_z = { "" },
	},
	-- winbar = {
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = { "filename" },
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {},
	-- },
	-- inactive_winbar = {
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = { "filename" },
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {},
	-- },
})
