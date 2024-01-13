local wezterm = require 'wezterm';
local config = {
  font = wezterm.font("HackGen35 Console NF"),
  use_ime = true,
  font_size = 14.0,
  color_scheme = "iceberg-dark",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.8,
}

return config
