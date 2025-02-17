local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 13.0

config.color_scheme = "Catppuccin Macchiato"

config.default_prog = { "nu" }

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.window_close_confirmation = "NeverPrompt"

return config
