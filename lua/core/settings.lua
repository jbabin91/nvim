local opt = vim.opt

opt.completeopt = 'menu,menuone,noselect'
opt.number = true
opt.relativenumber = true
opt.visualbell = false
opt.errorbells = false
opt.wrap = true
opt.textwidth = 79
opt.colorcolumn = '80'
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.spell = false
opt.showmode = false
opt.showcmd = true
opt.scrolloff = 8
opt.backspace = 'indent,eol,start'
opt.termguicolors = true

vim.g.neoformat_try_node_exe = 1
