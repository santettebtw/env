local hsl = require("lush.hsl")

local M = {}

M.dark = {
  -- Base colors
  bg         = hsl("#161616"),
  fg         = hsl("#C5C8C6"),
  black      = hsl("#27292D"),
  red        = hsl("#D44C6D"),
  green      = hsl("#30BA6F"),
  yellow     = hsl("#D0E460"),
  blue       = hsl("#7D57F8"),
  magenta    = hsl("#EB60D5"),
  cyan       = hsl("#01D6D4"),
  white      = hsl("#BDBDBD"),

  -- Bright variants
  br_black   = hsl("#4B4B4B"),
  br_red     = hsl("#FC5D85"),
  br_green   = hsl("#00D686"),
  br_yellow  = hsl("#E8FD70"),
  br_blue    = hsl("#9978FE"),
  br_magenta = hsl("#FC7BE9"),
  br_cyan    = hsl("#00FDFD"),
  br_white   = hsl("#E5E5E5"),

  -- Additional shades
  gray1      = hsl("#333333"),
  gray2      = hsl("#555555"),
  gray3      = hsl("#777777"),
  bg_dark    = hsl("#121212"),
  bg_light   = hsl("#202020"),
  bg_lighter = hsl("#2A2A2A"),
}

M.light = {
  -- Base colors
  bg         = hsl("#F5F5F5"),
  fg         = hsl("#161616"),
  black      = hsl("#27292D"),
  red        = hsl("#D44C6D").da(30),
  green      = hsl("#30BA6F").da(30),
  yellow     = hsl("#D0E460").da(30),
  blue       = hsl("#7D57F8").da(30),
  magenta    = hsl("#EB60D5").da(30),
  cyan       = hsl("#01D6D4").da(30),
  white      = hsl("#BDBDBD").da(30),

  -- Bright variants
  br_black   = hsl("#4B4B4B"),
  br_red     = hsl("#FC5D85").da(30),
  br_green   = hsl("#00D686").da(30),
  br_yellow  = hsl("#E8FD70").da(30),
  br_blue    = hsl("#9978FE").da(30),
  br_magenta = hsl("#FC7BE9").da(30),
  br_cyan    = hsl("#00FDFD").da(20),
  br_white   = hsl("#E5E5E5").da(30),

  -- Additional shades
  gray1      = hsl("#CCCCCC"),
  gray2      = hsl("#AAAAAA"),
  gray3      = hsl("#888888"),
  bg_dark    = hsl("#E8E8E8"), -- Slightly darker background shade
  bg_light   = hsl("#FFFFFF"), -- Pure white for highlights
  bg_lighter = hsl("#DCDCDC"), -- Light gray for subtle contrasts
}

return M
