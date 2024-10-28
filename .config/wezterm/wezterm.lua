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
		dark = "Github Dark",
		light = "Github (Gogh)",
	},
	gruvhub = {
		dark = "Gruvbox Material (Gogh)",
		light = "Catppuccin Latte (Gogh)",
	},
	nord = {
		dark = "nord",
		light = "Github (Gogh)",
	},
	custom = {
		dark = "github_dark",
		light = "github_light",
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

config.harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" }

config.color_scheme = scheme_for_appearance(get_appearance(), "custom")

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

-- config.background = {
-- 	{
-- 		width = "100%",
-- 		height = "100%",
-- 		opacity = 1,
-- 		source = {
-- 			Color = color,
-- 		},
-- 	},
-- 	{
-- 		source = {
-- 			File = os.getenv("HOME") .. "/.config/wezterm/forest.jpg",
-- 		},
-- 		opacity = 0.1,
-- 		hsb = {
-- 			saturation = 1,
-- 			hue = 1,
-- 			brightness = 1,
-- 		},
-- 	},
-- }

config.ssh_domains = {
	{
		name = "home",
		remote_address = "linux",
		username = "zackery",
	},
}

config.font = wezterm.font_with_fallback({
	{
		family = "Monaspace Neon",
		harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
	},
	{ family = "SpaceMono Nerd Font" },
})

config.font_rules = {
	{ -- Italic
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			-- family="Monaspace Radon",  -- script style
			family = "Monaspace Xenon", -- courier-like
			style = "Italic",
		}),
	},

	{ -- Bold
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "Monaspace Neon",
			-- family = "Monaspace Krypton",
			-- weight='ExtraBold',
			weight = "Bold",
		}),
	},

	{ -- Bold Italic
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Monaspace Xenon",
			style = "Italic",
			weight = "Bold",
		}),
	},
}

config.term = "wezterm"

config.max_fps = 160

return config
