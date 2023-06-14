-- Pull in the Wezterm API
local wezterm = require("wezterm")

local schemes = {
	catppuccin = {
		dark = "Catppuccin Macchiato",
		light = "Catppuccin Latte",
	},
	everforest = {
		dark = "Everforest Dark (Gogh)",
		light = "Everforest Light (Gogh)",
	},
	gruvbox = {
		dark = "Gruvbox Material (Gogh)",
		light = "Gruvbox Light",
	},
	github = {
		dark = "GitHub Dark",
		light = "GitHub Light",
	},
	gruvhub = {
		dark = "Gruvbox Material (Gogh)",
		light = "Github",
	},
}

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance, theme)
	if appearance:find("Dark") then
		return schemes[theme]["dark"]
	else
		return schemes[theme]["light"]
	end
end

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = scheme_for_appearance(get_appearance(), "gruvhub")

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.font_size = 14

config.window_background_opacity = 0.95

config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 10,
}

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "/Users/zack.griesinger/Pictures/green-forest-fog-nature-dawn.jpg",
-- 		},
-- 	},
--
-- } TODO

config.font = wezterm.font_with_fallback({
	{ family = "Rec Mono Semicasual" },
	{ family = "Symbols Nerd Font Mono", scale = 0.65 },
})

config.term = "wezterm"

return config
