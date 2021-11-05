-- Defining alias for vim.opt
local opt = vim.opt

-- Number settings
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- True color support
opt.termguicolors = true

-- Enable clipboard
opt.clipboard = "unnamedplus"

-- Enable mouse in all modes
opt.mouse = "a"

-- Enable cursor highlights
opt.cursorline = true
opt.cursorcolumn = true

-- Setting colorcolumn. This is set because of
-- this (https://github.com/lukas-reineke/indent-blankline.nvim/issues/59)
-- indent-blankline bug
opt.colorcolumn = "9999"

-- With set hidden you're telling Neovim that you
-- have unsaved work that's not displayed on your screen
opt.hidden = true

-- Set indentation stuff
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true

-- Set searching stuff
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Sets offset so there's space at the bottom
opt.scrolloff = 8

-- Without this option some times backspace did not work correctly
opt.backspace = "indent,eol,start"

-- For opening splits on right or bottom
opt.splitbelow = true
opt.splitright = false

-- Enabling ruler and statusline
opt.ruler = true
opt.laststatus = 2

-- Setting time that Neovim wait after each keystroke
opt.ttimeoutlen = 20
opt.timeoutlen = 750

-- Setting up autocomplete menu
opt.completeopt = "menuone,noselect"

-- Add cursorline and disable it in terminal
vim.cmd('autocmd WinEnter,BufEnter * if &ft is "toggleterm" | set nocursorline | else | set cursorline | endif')

-- Set line number for help files
vim.cmd
[[
  augroup help_config
    autocmd!
    autocmd FileType help :set number
  augroup END
]]

-- Auto open nvim-tree when writing (nvim .) in command line
-- and auto open Dashboard when nothing given as argument
vim.cmd
[[
  if index(argv(), ".") >= 0
    autocmd VimEnter * NvimTreeToggle
    bd1
  elseif len(argv()) == 0
    autocmd VimEnter * Dashboard
  endif
]]

vim.cmd("autocmd BufWritePost plugins.lua source <afile>")
