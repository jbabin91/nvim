local g = vim.g
local cmd = vim.cmd

-- Styles: [ "storm", "night", "day" ]
g.tokyonight_style = "night"

-- Configs
g.tokyonight_italic_comments = false
g.tokyonight_italic_keywords = false
g.tokyonight_italic_functions = false
g.tokyonight_italic_variables = false
g.tokyonight_transparent = false
g.tokyonight_hide_inactive_statusline = false
g.tokyonight_transparent_sidebar = false
g.tokyonight_dark_sidebar = true
g.tokyonight_dark_float = true
g.tokyonight_lualine_bold = false

cmd([[colorscheme tokyonight]])


