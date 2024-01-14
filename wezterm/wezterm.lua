local wezterm = require 'wezterm';
local act = wezterm.action

local config = {
  font = wezterm.font("HackGen35 Console NF"),
  use_ime = true,
  font_size = 14.0,
  color_scheme = "iceberg-dark",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.9,
  initial_rows = 60,
  initial_cols = 200,


  keys = {
    { key = "LeftArrow", mods = "CMD", action = act.ActivateTabRelative(1) },
    { key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(-1) },
    { key = "w", mods = "CMD", action = act.CloseCurrentPane{ confirm = true } },
    { key = "W", mods = "CMD", action = act.CloseCurrentPane{ confirm = true } },
    { key = "T", mods = "CMD", action = act.SpawnTab "CurrentPaneDomain" },
    { key = "S", mods = "CMD", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
    { key = "D", mods = "CMD", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
    { key = "H", mods = "CMD", action = act.ActivatePaneDirection("Left") },
    { key = "L", mods = "CMD", action = act.ActivatePaneDirection("Right") },
    { key = "K", mods = "CMD", action = act.ActivatePaneDirection("Up") },
    { key = "J", mods = "CMD", action = act.ActivatePaneDirection("Down") },
    { key = "h", mods = "CMD|CTRL", action = act.AdjustPaneSize{"Left", 10} },
    { key = "l", mods = "CMD|CTRL", action = act.AdjustPaneSize{"Right", 10} },
    { key = "k", mods = "CMD|CTRL", action = act.AdjustPaneSize{"Up", 5} },
    { key = "j", mods = "CMD|CTRL", action = act.AdjustPaneSize{"Down", 5} },
  }
}

return config

