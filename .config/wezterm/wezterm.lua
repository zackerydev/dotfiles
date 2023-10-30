-- Pull in the Wezterm APIsainnhe/gruvbox-material
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
		light = "Everforest Light (Gogh)",
	},
	github = {
		dark = "GitHub Dark",
		light = "GitHub (Gogh)",
	},
	gruvhub = {
		dark = "Gruvbox Material (Gogh)",
		light = "Everforest Light (Gogh)",
	},
	blank = {
		dark = "",
		light = "",
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

-- config.window_background_opacity = 0

config.window_padding = {
	left = 20,
	right = 20,
	top = 10,
	bottom = 10,
}

local color = "#1d2021"

if get_appearance():find("Light") then
	color = "#fffbef"
end

config.background = {
	{
		width = "100%",
		height = "100%",
		opacity = 1,
		source = {
			Color = color,
		},
	},
	{
		source = {
			File = os.getenv("HOME") .. "/.config/wezterm/forest.jpg",
		},
		opacity = 0.2,
		hsb = {
			saturation = 1,
			hue = 1,
			brightness = 1,
		},
	},
}

config.font = wezterm.font_with_fallback({
	{ family = "Cascadia Code" },
	{ family = "SpaceMono Nerd Font", scale = 0.8 },
})

config.term = "wezterm"

config.max_fps = 160

return config
