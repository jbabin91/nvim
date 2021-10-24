local g = vim.g
local cmd = vim.cmd

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
g.tokyonight_italic_comments = true
g.tokyonight_italic_keywords = true
g.tokyonight_italic_functions = true
g.tokyonight_italic_variables = true

cmd[[colorscheme tokyonight]]
