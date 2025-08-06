-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12
--config.color_scheme = "Gruvbox dark, pale (base16)"
--config.color_scheme = "Nord (Gogh)"
--config.color_scheme = "Dracula"
config.color_scheme = "Srcery (Gogh)"
--

config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
}
config.colors = {
	visual_bell = "#5B4A1A",
}
-- Finally, return the configuration to wezterm:
return config
