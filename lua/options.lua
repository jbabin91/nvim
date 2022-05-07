local g = vim.g
local set = vim.opt

-- General
set.clipboard = "unnamedplus"
set.splitbelow = true
set.splitright = true
set.showmode = false

-- Set highlight on search
set.hlsearch = false

-- Make line numbers default
set.number = true
set.relativenumber = true

-- Enable mouse mode
set.mouse = "a"

-- Enable break indent
set.breakindent = true

-- Save undo history
set.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

-- Decrease update time
set.updatetime = 250
set.timeoutlen = 500
set.signcolumn = "yes"

-- Indent
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 0

-- Set colorscheme
set.termguicolors = true

-- Autocomplete
set.completeopt = "menuone,noselect"
