local appearance = require 'appearance'

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Appearance
-- config.color_scheme = 'Arthur'
-- config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Dracula'
-- config.color_scheme = 'hardhacker'
-- config.color_scheme = 'Tokyo Night Storm'
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'Everforest Dark - Hard'

config.line_height = 1.1

-- Tab Bar
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.tab_max_width = 32

-- Values taken from the theme (should do something more dynamic)
local bg = '#6a7478'
local fg = '#d3c6aa'
local bg_active = '#dbbc7f'
local fg_active = '#1e2326'

config.colors = {
  tab_bar = {
    background = bg,
    active_tab = {
      bg_color = bg_active,
      fg_color = fg_active,
      intensity = 'Normal',
      underline = 'None',
      italic = true,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = bg,
      fg_color = fg,
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    new_tab_hover = {
      bg_color = bg_active,
      fg_color = fg_active,
      italic = true,
    },
  },
}

-- Dynamic Power line
local function segments_for_right_status(window)
  return {
    wezterm.strftime('%a %b %-d %H:%M'),
    wezterm.hostname(),
  }
end

wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  local segments = segments_for_right_status(window)

  -- Note the use of wezterm.color.parse here, this returns
  -- a Color object, which comes with functionality for lightening
  -- or darkening the colour (amongst other things).
  local bg = wezterm.color.parse(color_scheme.background)
  local fg = color_scheme.foreground

  -- Each powerline segment is going to be coloured progressively
  -- darker/lighter depending on whether we're on a dark/light colour
  -- scheme. Let's establish the "from" and "to" bounds of our gradient.
  local gradient_to, gradient_from = bg
  if appearance.is_dark() then
    gradient_from = gradient_to:lighten(0.4)
  else
    gradient_from = gradient_to:darken(0.4)
  end

  -- Yes, WezTerm supports creating gradients, because why not?! Although
  -- they'd usually be used for setting high fidelity gradients on your terminal's
  -- background, we'll use them here to give us a sample of the powerline segment
  -- colours we need.
  local gradient = wezterm.color.gradient(
    {
      orientation = 'Horizontal',
      colors = { gradient_from, gradient_to },
    },
    #segments -- only gives us as many colours as we have segments.
  )

  -- We'll build up the elements to send to wezterm.format in this table.
  local elements = {}

  for i, seg in ipairs(segments) do
    local is_first = i == 1

    if is_first then
      table.insert(elements, { Background = { Color = 'none' } })
    end
    table.insert(elements, { Foreground = { Color = gradient[i] } })
    table.insert(elements, { Text = SOLID_LEFT_ARROW })

    table.insert(elements, { Foreground = { Color = fg } })
    table.insert(elements, { Background = { Color = gradient[i] } })
    table.insert(elements, { Text = ' ' .. seg .. ' ' })
  end

  window:set_right_status(wezterm.format(elements))
end)

-- Term
config.term = 'xterm-256color'
-- config.term = 'wezterm'

-- Windows specific config
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe' }
    config.win32_system_backdrop = 'Acrylic' -- could use 'Mica' too
    config.window_background_opacity = 0.8
else
    config.window_background_opacity = 0.9
end

-- Window
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"

-- Font
config.font = wezterm.font('Hack Nerd Font Mono', { weight = 'Regular' })
config.font_size = 11

-- Keybinds
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.DisableDefaultAssignment,
  },
  -- Vertical Pane split
  {
    key = '\\',
    mods = 'SUPER',
    action = wezterm.action.SplitHorizontal,
  },
  -- Horizontal Pane split
  {
    key = '-',
    mods = 'SUPER',
    action = wezterm.action.SplitVertical,
  },
}

-- Return the configuration
return config
