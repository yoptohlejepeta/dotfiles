local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-attached", function(domain)
  -- maximize all displayed windows on startup
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)

local config = wezterm.config_builder()

local light_theme = "Catppuccin Latte"
local dark_theme = "Moonfly (Gogh)"
-- local dark_theme = "Dracula (Official)"

local appearance_themes = {
  Light = light_theme,
  Dark = dark_theme,
}

local appearance = wezterm.gui.get_appearance()
config.color_scheme = appearance_themes[appearance] or dark_theme

config.font = wezterm.font { family = "Martian Mono NF" }
-- config.font = wezterm.font { family = "Maple Mono NF" }
config.font_rules = {
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'VictorMono Nerd Font',
      weight = 'Bold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Half',
    font = wezterm.font {
      family = 'VictorMono Nerd Font',
      weight = 'DemiBold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = 'VictorMono Nerd Font',
      style = 'Italic',
    },
  },
}

config.font_size = 15.0
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
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
--
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
-- config.tab_bar_style = {
--   active_tab_left = wezterm.format {
--     { Text = SOLID_LEFT_ARROW },
--   },
--   active_tab_right = wezterm.format {
--     { Text = SOLID_RIGHT_ARROW },
--   },
--   inactive_tab_left = wezterm.format {
--     { Text = SOLID_LEFT_ARROW },
--   },
--   inactive_tab_right = wezterm.format {
--     { Text = SOLID_RIGHT_ARROW },
--   },
-- }

config.keys = {
  {
    key = "H",
    mods = "CTRL",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "J",
    mods = "CTRL",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  { key = "K", mods = "CTRL", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
  {
    key = "L",
    mods = "CTRL",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    key = "h",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({ direction = "Left" }),
  },
  {
    key = "l",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({ direction = "Right" }),
  },
  {
    key = "j",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({ direction = "Down" }),
  },
  {
    key = "k",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({ direction = "Up" }),
  },
  {
    key = "w",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
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
