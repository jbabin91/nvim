local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

cmd [[syntax enable]] -- syntax highlighting
-- Set highlight on search
opt.hlsearch = false
opt.number = true -- Make line numbers default
opt.rnu = true -- Relative line numbers
opt.mouse = "a" -- Enable mouse mode
opt.modeline = true -- Enable modlines for files
opt.modelines = 5 -- Number of modelines
opt.showmode = false
opt.cursorline = true -- Highlight line cursor is in
-- Tab settings
opt.tabstop = 2 -- 2 tabstop
opt.shiftwidth = 2
opt.expandtab = true -- tabs -> spaces
opt.smartindent = true -- nice indenting
opt.foldmethod = "marker" -- set fold method to marker
-- Enable break indent
opt.breakindent = true
-- Backup/Swap files
opt.swapfile = false -- have files saved to swap
opt.undofile = true -- File undo history preserved outside current session
-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true
-- Decrease update time
opt.updatetime = 250
opt.signcolumn = "yes"
opt.termguicolors = true
-- New win split options
opt.splitbelow = true
opt.splitright = true
-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- Disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
g.loaded_matchparen        = 1
g.loaded_matchit           = 1
g.loaded_logiPat           = 1
g.loaded_rrhelper          = 1
g.loaded_tarPlugin         = 1
g.loaded_gzip              = 1
g.loaded_zipPlugin         = 1
g.loaded_2html_plugin      = 1
g.loaded_shada_plugin      = 1
g.loaded_spellfile_plugin  = 1
g.loaded_netrw             = 1
g.loaded_netrwPlugin       = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_remote_plugins    = 1

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

