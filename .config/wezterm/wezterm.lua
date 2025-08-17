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

config.color_scheme = scheme_for_appearance(get_appearance(), "everforest")

config.enable_tab_bar = true

config.window_decorations = "RESIZE"

config.font_size = 14

config.ssh_domains = {
	{
		name = "home",
		remote_address = "linux",
		username = "zackery",
	},
}

config.font = wezterm.font_with_fallback({
	{
		family = "CommitMono Nerd Font",
	},
	{ family = "SpaceMono Nerd Font" },
})

-- Workspace Configuration
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

config.default_workspace = "~"

config.keys = {
	-- Navigate panes with Command+HJKL
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Resize panes with Command+Shift+HJKL
	{ key = "h", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },

	-- Split panes
	{ key = "o", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "p", mods = "CMD", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "s", mods = "CMD", action = workspace_switcher.switch_workspace() },
  -- Palette
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 's',
    mods = 'CMD|SHIFT',
    action = wezterm.action.PromptInputLine {
      description = 'Enter name for new workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
}

config.use_fancy_tab_bar = true

return config
