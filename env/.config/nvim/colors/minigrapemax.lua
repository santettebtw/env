-- "Less colors" vibe
-- Lightness levels are 15+85 for 'dark' and 90+20 for 'light'. Picked by hand.
-- There is no reference hue and chroma. Instead, tweak reference grey colors
-- (with chroma 0 and reference lightness values) in such a way so that:
-- - Background and accent color is azure.
-- - Diff's cyan is closer to cyan.
local is_dark = vim.o.background == 'dark'
local bg = is_dark and '#161616' or '#C5C8C6'
local fg = is_dark and '#C5C8C6' or '#161616'

-- Alternative with precisely manipulated colors to reduce their usage while
-- retaining usability
local hues = require('mini.hues')
local p = hues.make_palette({
    background = bg,
    n_hues = 8,
    foreground = fg,
    -- Make it "less colors"
    saturation = is_dark and 'high' or 'high',
    accent = 'blue',
})

p.red = "#D44C6D"
p.green = "#30BA6F"
p.yellow = '#E8FD70'
p.blue = "#7D57F8"
p.purple = "#EB60D5"
p.cyan = "#01D6D4"


hues.apply_palette(p)
vim.g.colors_name = 'minigrapemax'

-- Tweak highlight groups for general usability (acounting for removed colors)
local hi = function(group, data) vim.api.nvim_set_hl(0, group, data) end

hi('DiagnosticInfo', { fg = p.azure })
hi('DiagnosticUnderlineInfo', { sp = p.azure, underline = true })
hi('DiagnosticFloatingInfo', { fg = p.azure, bg = p.bg_edge })

hi('MiniHipatternsTodo', { fg = p.bg, bg = p.azure, bold = true })
hi('MiniIconsBlue', { fg = p.azure })
hi('MiniIconsOrange', { fg = p.yellow })

hi('@keyword.return', { fg = p.accent, bold = true })
hi('Delimiter', { fg = p.fg_edge2 })
hi('@markup.heading.1', { fg = p.accent, bold = true })
hi('LineNr', { fg = p.accent, bg = p.bg_edge, bold = true })
hi('LineNrAbove', { fg = p.bg_mid2, bg = p.bg_edge, bold = true })
hi('LineNrBelow', { fg = p.bg_mid2, bg = p.bg_edge, bold = true })
hi('SignColumn', { bg = p.bg_edge, bold = true })
hi('Visual', { fg = p.bg, bg = p.yellow })
hi('@variable', {fg = p.fg})
hi('Identifier', {fg = p.fg})
hi('Identifier', {fg = p.fg})
hi('@lsp.type.property', {fg = p.cyan})
hi('Constant', {fg = p.yellow})
hi('Function', {fg = p.blue, bold = true})
hi('Statement', {fg = p.red})
