-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = false
-- config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Nerd Font Symbols")
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14
config.macos_window_background_blur = 30
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 28,
	top = 28
}
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500
config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "'",
		mods = "CTRL",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
}
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- and finally, return the configuration to wezterm
return config
