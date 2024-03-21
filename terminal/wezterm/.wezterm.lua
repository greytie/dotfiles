-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme
--config.color_scheme = 'AdventureTime'

-- Spawn a fish shell in login mode
--config.default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-Command "Start-Process PowerShell -Verb RunAs"'}

config.default_prog = { 'powershell', '-NoLogo' }
--config.window_decorations = "RESIZE"

config.initial_cols = 160
config.initial_rows = 32
config.font = wezterm.font('JetBrains Mono', { italic = false })
config.font_size = 14
--config.disable_default_key_bindings = true

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
	config.keys = {
		{
			key = 't',
			mods = 'CTRL',
			action = act.SpawnTab 'CurrentPaneDomain',
		},
		{
			key = 'w',
			mods = 'CTRL',
			action = act.CloseCurrentTab { confirm = true },
		},
		{ key = 'l', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
		{ key = 'h', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
	}
end

--[[
	Event for when terminal opens. Use to setfenv
	terminal window properties
]]--
wezterm.on('gui-startup', function()
	local tab, pane, window = mux.spawn_window({})
	--window:gui_window():maximize()
	window:gui_window():set_position(300, 300)
end)


-- and finally, return the configuration to wezterm
return config