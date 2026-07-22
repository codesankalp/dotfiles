local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 60

config.color_scheme = 'rose-pine-moon'
-- the builtin scheme's selection_bg matches the background, so selections
-- are invisible; override with rose-pine-moon's highlight-high
config.colors = {
  selection_bg = '#56526e',
  selection_fg = 'none', -- keep each cell's own text colour
}
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
config.native_macos_fullscreen_mode = true
-- required for Shift+Enter (and other modified keys) to reach apps that
-- use the kitty keyboard protocol (e.g. multiline input in CLIs/TUI tools)
config.enable_kitty_keyboard = true

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
  {
    key = 'f',
    mods = 'CMD|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
  -- zsh's emacs keymap moves by word on ESC-b/ESC-f, not OPT+Arrow
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey { key = 'b', mods = 'ALT' },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey { key = 'f', mods = 'ALT' },
  },
  -- zsh binds backward-kill-word to Ctrl-W
  {
    key = 'Backspace',
    mods = 'OPT',
    action = wezterm.action.SendString '\x17',
  },
  -- zsh binds beginning/end-of-line to Ctrl-A/Ctrl-E
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendString '\x01',
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.SendString '\x05',
  },
  -- zsh binds kill-whole-line to Ctrl-U
  {
    key = 'Backspace',
    mods = 'CMD',
    action = wezterm.action.SendString '\x15',
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
}

-- tmux's `mouse on` captures clicks before wezterm's link handling sees them;
-- holding CMD bypasses that (wezterm's default bypass modifier is SHIFT)
config.bypass_mouse_reporting_modifiers = 'SUPER'

config.mouse_bindings = {
  -- the default click/drag bindings with SUPER held, so CMD+drag selects
  -- natively even under tmux; Down keeps the click from reaching the pane
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'SUPER',
    action = wezterm.action.SelectTextAtMouseCursor 'Cell',
  },
  {
    event = { Drag = { streak = 1, button = 'Left' } },
    mods = 'SUPER',
    action = wezterm.action.ExtendSelectionToMouseCursor 'Cell',
  },
  -- a CMD+click without drag leaves an empty selection, so this still
  -- opens the link under the cursor
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'SUPER',
    action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor 'ClipboardAndPrimarySelection',
  },
}

return config
