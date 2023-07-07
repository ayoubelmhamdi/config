local wezterm = require("wezterm")

return {
	default_cursor_style = "SteadyBar",
	font = wezterm.font("FiraCode Nerd Font"),
	color_scheme = "Gruvbox Dark",
	colors = {
		foreground = "#e0def4",
		background = "#282828",
		cursor_bg = "#dddddd",
		cursor_fg = "#12121e",
		selection_fg = "#12121e",
		selection_bg = "#FFFACD",
	},
	font_size = 16,
	-- window_background_opacity = 0.15,
	-- enable_tab_bar = false,
	adjust_window_size_when_changing_font_size = false,
	-- background = "#2e3440",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	keys = {
		{ key = "n", mods = "SHIFT|CTRL", action = wezterm.action.ToggleFullScreen },
		{ key = "w", mods = "SHIFT|ALT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
		{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
		{ key = "0", mods = "CTRL", action = "ResetFontSize" },
		-- { key = "C", mods = "CTRL|SHIFT", action = "Copy" },
		-- { key = "V", mods = "CTRL|SHIFT", action = "Paste" },
		{ key = "J", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "K", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "X", mods = "SHIFT|ALT", action = "ActivateCopyMode" },
		{ key = " ", mods = "SHIFT|ALT", action = "QuickSelect" },
	},
}
-- fin keys
