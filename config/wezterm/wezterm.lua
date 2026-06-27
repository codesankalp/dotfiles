local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 140
config.initial_rows = 40

config.color_scheme = 'rose-pine-moon'
config.max_fps = 120
config.font = wezterm.font_with_fallback({
  'Hack Nerd Font',
  'Fira Code',
  'JetBrains Mono',
  'Noto Color Emoji',
})

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_frame = {
  font = wezterm.font('Hack Nerd Font', { weight = 'Bold' }),
}
config.inactive_pane_hsb = {
  saturation = 0.0,
  brightness = 0.5,
}
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50
config.font_size = 15.0
config.window_frame.font_size = 13.0

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
