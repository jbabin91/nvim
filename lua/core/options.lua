local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true

opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.cursorline = true
opt.wildmenu = true
opt.termguicolors = true

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.completeopt = "menuone,noselect"
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showcmd = false
opt.ruler = false
opt.showtabline = 0
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 250
opt.updatetime = 300
opt.undofile = true
opt.laststatus = 3
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.shortmess:append("c")
opt.whichwrap:append("<>[]hl")
opt.iskeyword:append("-")


-- Theme
g.tokyonight_style = "night"
g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
local present, _ = pcall(require, "tokyonight")
if present then
  vim.cmd("colorscheme tokyonight")
end
