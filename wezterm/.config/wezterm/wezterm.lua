local wezterm = require("wezterm")
local act = wezterm.action

local ALTKEY = "ALT"
local SUPPER = "SUPER"
local colors = {
	foreground = "#a89984",
	background = "#21262D",
	cursor_bg = "#a89984",
	cursor_fg = "#21262D",
	cursor_border = "#a89984",
	selection_bg = "#a89984",
	selection_fg = "#21262D",
	ansi = { "#21262D", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984" },
	brights = { "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },
}

local rename_title = act.PromptInputLine({
	description = "Enter new name for tab",
	action = wezterm.action_callback(function(window, pane, line)
		if line then
			window:active_tab():set_title(line)
		end
	end),
})

local split_pane = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } })
local toggleFullScreen = wezterm.action.ToggleFullScreen

local new_tab = wezterm.action({ SpawnTab = "CurrentPaneDomain" })
local next_tab = wezterm.action({ ActivateTabRelative = -1 })
local prev_tab = wezterm.action({ ActivateTabRelative = 1 })
local searching = wezterm.action({ Search = { CaseSensitiveString = "" } })
local coping = wezterm.action({ CopyTo = "Clipboard" })
local pasting = wezterm.action({ PasteFrom = "Clipboard" })
local selecting = wezterm.action({ PasteFrom = "PrimarySelection" })

local mykeys = {
	{ mods = SUPPER, key = "E", action = rename_title },
	--
	{ mods = "CTRL|SHIFT", key = "F", action = searching },
	{ mods = "CTRL|SHIFT", key = "C", action = coping },
	{ mods = "CTRL|SHIFT", key = "V", action = pasting },
	--
	{ mods = ALTKEY, key = "n", action = split_pane },
	{ mods = "CTRL", key = "=", action = "IncreaseFontSize" },
	{ mods = "CTRL", key = "-", action = "DecreaseFontSize" },
	{ mods = "CTRL", key = "0", action = "ResetFontSize" },
	{ mods = ALTKEY, key = "h", action = next_tab },
	{ mods = ALTKEY, key = "l", action = prev_tab },
	{ mods = SUPPER, key = "n", action = new_tab },
	--
	{ key = "Insert", action = selecting },
	{ key = "F11", action = toggleFullScreen },
} -- fin keys

for i = 1, 8 do
	table.insert(mykeys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action({ ActivateTab = i - 1 }),
	})
end

return {
	default_cursor_style = "SteadyBar",
	font = wezterm.font("FiraCode Nerd Font"),
	color_scheme = "Gruvbox Dark",
	colors = colors,
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
	keys = mykeys,
}
