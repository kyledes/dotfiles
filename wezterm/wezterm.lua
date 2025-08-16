-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font("Mononoki Nerd Font")

--config.font = wezterm.font("Mononoki Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
-- or, changing the font size and color scheme.
config.font_size = 12
--config.color_scheme = "Gruvbox dark, pale (base16)"
--config.color_scheme = "Nord (Gogh)"
--config.color_scheme = "Dracula"
--config.color_scheme = "Sorcery (Gogh)"
config.color_scheme = "Warm Neon (Gogh)"
--config.color_scheme = "Gruvbox Material Dark"

config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
}

config.colors = {
	visual_bell = "#5B4A1A",
	background = "#221912", -- dark brown, replace with your preferred hex
}

config.ssh_domains = {
	{
		-- This name identifies the domain
		name = "dev",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "dev.desmarais.family",
		-- The username to use on the remote host
		username = "kyle",
	},
}
config.hide_tab_bar_if_only_one_tab = true
-- Finally, return the configuration to wezterm:
return config
