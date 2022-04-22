local opt = vim.opt
local cmd = vim.cmd

-- General
opt.mouse = 'a' -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile
opt.updatetime = 250 -- Length of time to wait before triggered the plugin
opt.timeoutlen = 300 -- Length of time to wait for a mapped sequences
opt.number = true -- show line number
opt.relativenumber = true -- show relative line number
opt.showmatch = true -- highlight matching parenthesis
opt.showmode = false -- disable show mode
opt.foldmethod = 'marker' -- enable folding (defult 'foldmarker')
opt.splitbelow = true -- horizontal split to the bottom
opt.splitright = true -- vertical split to the right
opt.ignorecase = true -- ignore case letters when searching
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- wrap on word boundary
opt.encoding = 'utf-8' -- set encoding to utf-8
opt.cursorline = true -- highlight the current line
opt.signcolumn = 'yes' -- always show the sign column
opt.laststatus = 3 -- global status line
opt.undofile = true -- save undo history
opt.diffopt = 'internal,filler,vertical'

-- Memory, CPU
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster Scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-- Tabs, indent
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 0
opt.smartindent = true
opt.autoindent = true

-- disable nvim intro
opt.shortmess:append 'sI'

-- Set colorscheme
opt.termguicolors = true -- enable 24-bit RGB colors
cmd [[colorscheme onedark]]
