local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'JetBrainsMono NF'
config.font_size = 13.0

config.color_scheme = 'Dracula (Official)'

config.default_prog = { 'nu' }

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

config.window_decorations = "TITLE | RESIZE"

return config
