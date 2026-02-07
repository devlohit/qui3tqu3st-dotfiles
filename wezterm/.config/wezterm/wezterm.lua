local wezterm = require("wezterm")
local config = wezterm.config_builder()
local constants = require("constants")
-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" })
config.font_size = 12
config.line_height = 1.2
config.freetype_load_target = "Normal"
config.freetype_interpreter_version = 40

-- Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

-- Appearance
config.color_scheme = "rose-pine"
-- config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 10,
	right = 0,
	top = 0,
	bottom = 0,
}
config.initial_rows = 52
config.initial_cols = 253
-- config.window_decorations = "RESIZE"
config.window_background_image = constants.bg_image
config.front_end = "WebGpu"

-- Miscellaneous settings
config.max_fps = 144
config.prefer_egl = true

return config
