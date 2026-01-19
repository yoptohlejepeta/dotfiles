local wezterm = require("wezterm")
local theme = require("lua/vague")
-- local domains = require("domains")

local config = wezterm.config_builder()

-- config.colors = theme.colors()
config.color_scheme = 'Gruvbox dark, hard (base16)'

config.font = wezterm.font({ family = "Martian Mono NF" })
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "VictorMono Nerd Font",
			weight = "Bold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			family = "VictorMono Nerd Font",
			weight = "DemiBold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({
			family = "VictorMono Nerd Font",
			style = "Italic",
		}),
	},
}

config.font_size = 18.0
config.tab_max_width = 30
config.window_decorations = "NONE"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.use_resize_increments = true
-- config.ssh_domains = domains

config.keys = {
	{
		key = "LeftArrow",
		mods = "CTRL",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "DownArrow",
		mods = "CTRL",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "UpArrow", mods = "CTRL", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "RightArrow",
		mods = "CTRL",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "h",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "v",
		mods = "ALT",
		action = wezterm.action.SplitPane({ direction = "Right" }),
	},
	{
		key = "s",
		mods = "ALT",
		action = wezterm.action.SplitPane({ direction = "Down" }),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
